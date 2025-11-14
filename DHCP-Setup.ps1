#DHCP rolli paigaldamine
Install-WindowsFeature -Name DHCP -IncludeManagementTools

#DHCP autoriseerimine AD's
Add-DhcpServerInDC -DnsName "ad1.lillep.local" -IpAddress 10.0.22.10

#DHCP scope KOOL loomine
Add-DhcpServerv4Scope
    -Name "KOOL"
    -StartRange 10.0.22.100
    -EndRange 10.0.22.120
    -SubnetMask 255.255.255.0

#Gateway seadistamine (ruuter)
Set-ShcpServerv4OptionValue -ScopeId 10.0.22.0 -Router 10.0.22.2

#DNSi seadistamine (domeenikontroller)
Set-DhcpServerv4OptionValue -ScopeId 10.0.22.0 -DnsServer 10.0.22.10 -DnsDomain "lillep.local"

Write-Host "DHCP server seadistatud."