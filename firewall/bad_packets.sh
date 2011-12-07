###
# Create filter chains
###
$command -N bad_tcp_packets
$command -N bad_icmp_packets

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
# Should likely tuned based on expected limit of desired connections/second.
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

