Import-Module -Name Pode,Pode.Web

Start-PodeServer {
    Add-PodeEndpoint -Address * -Port 443 -Protocol Https -Name User -SelfSigned
    Use-PodeWebTemplates -Title 'test' -Theme Dark
}