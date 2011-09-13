#!/bin/bash

###
# Server firewall script
###

iface="eth0"
commands=( iptables ip6tables )

for command in "${commands[@]}"; do
  declare icmp
  declare lo_ip
  if [[ "$command" = "ip6tables" ]]; then
    icmp="icmpv6"
    lo_ip="::1"
    echo "Configuring rules for IPv6"
    echo "  Verify with: ip6tables -L -v -n"
    echo "  Save with: service ip6tables save"
  else
    icmp="icmp"
    lo_ip="127.0.0.1"
    echo "Configuring rules for IPv4"
    echo "  Verify with: iptables -L -v -n"
    echo "  Save with:   service iptables save"
  fi
  echo ""

  ###
  # Flush rules
  ###
  echo "*** Flushing Rules"
  $command -F
  $command -X
  $command -Z

  echo "*** Configuring Default Policy"
  source default_policy.sh

  ###
  # Create filter chains
  ###
  $command -N bad_packets
  $command -N inbound
  $command -N outbound

  echo "*** Configuring Bad-Packet Chains"
  source bad_packets.sh
  echo "*** Configuring Inbound Chains"
  source inbound.sh
  echo "*** Configuring Outbound Chains"
  source outbound.sh

  ###
  # INPUT
  ###
  echo "*** Setting up INPUT Filtering"
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
  echo "*** Setting up OUTPUT Filtering"
  # Loopback
  $command -A OUTPUT -p ALL -s $lo_ip -j ACCEPT
  $command -A OUTPUT -p ALL -o lo -j ACCEPT

  # Chains
  $command -A OUTPUT -p ALL -j bad_packets
  $command -A OUTPUT -p ALL -j outbound

  echo ""
done
