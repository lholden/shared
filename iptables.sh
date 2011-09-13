#!/bin/bash

###
# Server firewall script
###

iface="eth0"
commands=( iptables ip6tables )

for command in "${commands[@]}"; do
  icmp="icmp"
  lo_ip="127.0.0.1"
  if [[  "$command" = "ip6tables" ]]; then
    icmp="icmpv6"
    lo_ip="::1"
  fi

  ###
  # Flush rules
  ###
  $command -F
  $command -X
  $command -Z


  ###
  # Default policy
  ###
  $command -P INPUT DROP
  $command -P OUTPUT ACCEPT
  $command -P FORWARD DROP


  ###
  # Create filter chains
  ###
  $command -N bad_packets
  $command -N bad_tcp_packets
  $command -N bad_icmp_packets

  $command -N blacklisted_inbound
  $command -N allowed_inbound
  $command -N udp_inbound
  $command -N tcp_inbound
  $command -N icmp_inbound


  ###
  # Chain: bad_packets
  ###
  $command -A bad_packets -p ALL -m state --state INVALID -j DROP
  $command -A bad_packets -p tcp -j bad_tcp_packets
  $command -A bad_packets -p $icmp -j bad_icmp_packets
  $command -A bad_packets -p ALL -j RETURN

  ###
  # Chain: bad_tcp_packets
  ###
  # New not syn
  $command -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

  # Stealth scan
  $command -A bad_tcp_packets -p tcp --tcp-flags ALL NONE -j DROP
  $command -A bad_tcp_packets -p tcp --tcp-flags ALL ALL -j DROP
  $command -A bad_tcp_packets -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
  $command -A bad_tcp_packets -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j DROP
  $command -A bad_tcp_packets -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
  $command -A bad_tcp_packets -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP

  # Syn Flooding
  $command -A bad_tcp_packets -p tcp --syn -m limit --limit 100/second --limit-burst 150 -j RETURN
  $command -A bad_tcp_packets -p tcp --syn -j DROP

  $command -A bad_tcp_packets -p tcp -j RETURN


  ###
  # Chain: bad_icmp_packets ###
  ###
  # Fragments are invalid
  if [[  "$command" = "iptables" ]]; then
    $command -A bad_icmp_packets -p $icmp --fragment -j DROP
  fi

  # Echo replies
  $command -A bad_icmp_packets -p $icmp --${icmp}-type 8 -m limit --limit 20/second --limit-burst 50 -j RETURN
  $command -A bad_icmp_packets -p $icmp --${icmp}-type 8 -j DROP

  $command -A bad_icmp_packets -p $icmp -j RETURN

  
  ###
  # Chain: Blacklisted Inbound
  ###
  $command -A blacklisted_inbound -m pkttype --pkt-type broadcast -j DROP

  $command -A blacklisted_inbound -j RETURN


  ###
  # Chain: UDP Inbound
  ###
  # Teamspeak 3 - Voice
  $command -A udp_inbound -p UDP --dport 9987 -j ACCEPT

  $command -A udp_inbound -p UDP -j RETURN
  
  
  ###
  # Chain: TCP Inbound
  ###
  # SSH
  $command -A tcp_inbound -p TCP --dport 2200 -j ACCEPT

  $command -A tcp_inbound -p TCP -j RETURN


  ###
  # Chain: ICMP Inbound 
  ###
  # Echo Request
  $command -A icmp_inbound -p $icmp --${icmp}-type 8 -j ACCEPT

  # Time Exceeds
  $command -A icmp_inbound -p $icmp --${icmp}-type 11 -j ACCEPT

  $command -A icmp_inbound -p $icmp -j RETURN
  
  
  ###
  # INPUT
  ###
  # Loopback
  $command -A INPUT -i lo -j ACCEPT

  # Chains
  $command -A INPUT -p ALL -j bad_packets
  $command -A INPUT -p ALL -j blacklisted_inbound
  $command -A INPUT -p TCP -i $iface -j tcp_inbound
  $command -A INPUT -p UDP -i $iface -j udp_inbound
  $command -A INPUT -p $icmp -i $iface -j icmp_inbound

  # Established connections
  $command -A INPUT -p ALL -i $iface -m state --state ESTABLISHED,RELATED -j ACCEPT


  ###
  # OUTPUT
  ###

  # Chains
  $command -A OUTPUT -p ALL -j bad_packets

  # Loopback
  $command -A OUTPUT -p ALL -s $lo_ip -j ACCEPT
  $command -A OUTPUT -p ALL -o lo -j ACCEPT

  # To the internet
  $command -A OUTPUT -p ALL -o $iface -j ACCEPT
done
