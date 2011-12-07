###
# Chain: Outbound
###
# To the internet!
$command -A outbound -p ALL -o $iface -j ACCEPT
$command -A outbound -j RETURN
