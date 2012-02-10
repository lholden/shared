###
# Create filter chains
###
$command -N blacklisted_inbound
$command -N udp_inbound
$command -N tcp_inbound
$command -N icmp_inbound

###
# Chain: Inbound
###
$command -A inbound -p ALL -j blacklisted_inbound
$command -A inbound -p UDP -j udp_inbound
$command -A inbound -p TCP -j tcp_inbound
$command -A inbound -p $icmp -j icmp_inbound
$command -A inbound -p ALL -j RETURN

###
# Chain: Blacklisted Inbound
###
$command -A blacklisted_inbound -m pkttype --pkt-type broadcast -j DROP
$command -A blacklisted_inbound -j RETURN

###
# Chain: UDP Inbound
###
# $command -A udp_inbound -p UDP --dport 12345 -j ACCEPT # Example UDP port
$command -A udp_inbound -p UDP -j RETURN

###
# Chain: TCP Inbound
###
#$command -A tcp_inbound -p TCP --dport 22 -j ACCEPT # SSH
$command -A tcp_inbound -p TCP -j RETURN

###
# Chain: ICMP Inbound 
###

if [[ "$command" = "ip6tables" ]]; then
  $command -A icmp_inbound -p icmpv6 --icmpv6-type destination-unreachable -j ACCEPT
  $command -A icmp_inbound -p icmpv6 --icmpv6-type packet-too-big -j ACCEPT
  $command -A icmp_inbound -p icmpv6 --icmpv6-type time-exceeded -j ACCEPT
  $command -A icmp_inbound -p icmpv6 --icmpv6-type parameter-problem -j ACCEPT

  $command -A icmp_inbound -p icmpv6 --icmpv6-type echo-request -m limit --limit 900/min -j ACCEPT
  $command -A icmp_inbound -p icmpv6 --icmpv6-type echo-reply -m limit --limit 900/min -j ACCEPT

  $command -A icmp_inbound -p icmpv6 --icmpv6-type router-advertisement -m hl --hl-eq 255 -j ACCEPT
  $command -A icmp_inbound -p icmpv6 --icmpv6-type neighbor-solicitation -m hl --hl-eq 255 -j ACCEPT
  $command -A icmp_inbound -p icmpv6 --icmpv6-type neighbor-advertisement -m hl --hl-eq 255 -j ACCEPT
  $command -A icmp_inbound -p icmpv6 --icmpv6-type redirect -m hl --hl-eq 255 -j ACCEPT
else
  $command -A icmp_inbound -p icmp --icmp-type echo-request -m limit --limit 900/min -j ACCEPT
  $command -A icmp_inbound -p icmp --icmp-type echo-reply   -m limit --limit 900/min -j ACCEPT
  $command -A icmp_inbound -p icmp --icmp-type destination-unreachable -j ACCEPT
  $command -A icmp_inbound -p icmp --icmp-type time-exceeded -j ACCEPT
fi

$command -A icmp_inbound -p $icmp -j RETURN

