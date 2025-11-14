#Kausta loomine
if (!(Test-Path "C:\Skriptid")) {
    New-Item -Path "C:\Skriptid" -ItemType Directory
}

#IP Seadistamine
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "10.0.22.10" -PrefixLength 24 -DefaultGateway "10.0.22.1"

Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses ("127.0.0.1", "1.1.1.1")

#Arvuti nime muutmine
Rename-Computer -NewName "AD1" -Force

#Serveri restart pärast nime muutmist
Write-Host "Restarting server..."
Restart-Computer