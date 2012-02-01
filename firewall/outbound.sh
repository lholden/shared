###                                                                                                           
# Create filter chains
###
$command -N blacklisted_outbound
$command -N icmp_outbound

###
# Chain: Outbound
###
$command -A outbound -p ALL -j blacklisted_outbound
$command -A outbound -p ALL -j icmp_outbound
$command -A outbound -p ALL -o $iface -j ACCEPT
$command -A outbound -j RETURN

###
# Chain: Blacklisted Outbound
###
$command -A blacklisted_outbound -j RETURN

###
# Chain: ICMP Outbound
###
if [[ "$command" = "ip6tables" ]]; then
  $command -A icmp_outbound -p icmpv6 --icmpv6-type neighbour-solicitation  -m hl --hl-eq 255 -j ACCEPT
  $command -A icmp_outbound -p icmpv6 --icmpv6-type neighbour-advertisement -m hl --hl-eq 255 -j ACCEPT
  $command -A icmp_outbound -p icmpv6 --icmpv6-type router-solicitation     -m hl --hl-eq 255 -j ACCEPT
  $command -A icmp_outbound -p icmpv6 --icmpv6-type router-advertisement -j REJECT
  $command -A icmp_outbound -p icmpv6 --icmpv6-type redirect             -j REJECT
fi
$command -A icmp_outbound -j RETURN

$command -A outbound -p ALL -o $iface -j ACCEPT
$command -A outbound -j RETURN
