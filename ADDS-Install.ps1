#AD paigaldamine DNSiga
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
Install-WindowsFeature DNS -IncludeManagementTools

#Domeeni lillep.local loomine
Install-ADDSForest
    -DomainName "lillep.local"
    -DomainNetbiosName "LILLEP"
    -SafeModeAdministratorPassword (ConvertTo-SecureString "Passw0rd" -AsPlainText -Force)
    -InstallDNS
    -Force