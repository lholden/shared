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
# $command -A udp_inbound -p UDP --dport 12345 -j ACCEPT
$command -A udp_inbound -p UDP -j RETURN

###
# Chain: TCP Inbound
###
#$command -A tcp_inbound -p TCP --dport 22 -j ACCEPT
$command -A tcp_inbound -p TCP -j RETURN

###
# Chain: ICMP Inbound 
###
# Echo Request
# $command -A icmp_inbound -p $icmp --${icmp}-type 8 -j ACCEPT

# Time Exceeds
$command -A icmp_inbound -p $icmp --${icmp}-type 11 -j ACCEPT

$command -A icmp_inbound -p $icmp -j RETURN

