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

  source default_policy.sh

  ###
  # Create filter chains
  ###
  $command -N bad_packets
  $command -N inbound
  $command -N outbound

  source bad_packets.sh
  source inbound.sh
  source outbound.sh

  ###
  # INPUT
  ###
  # Loopback
  $command -A INPUT -i lo -j ACCEPT

  # Chains
  $command -A INPUT -p ALL -j bad_packets
  $command -A INPUT -p ALL -i $iface -j inbound

  # Established connections
  $command -A INPUT -p ALL -i $iface -m state --state ESTABLISHED,RELATED -j ACCEPT

  ###
  # OUTPUT
  ###

  # Loopback
  $command -A OUTPUT -p ALL -s $lo_ip -j ACCEPT
  $command -A OUTPUT -p ALL -o lo -j ACCEPT

  # Chains
  $command -A OUTPUT -p ALL -j bad_packets
  $command -A OUTPUT -p ALL -j outbound
done
