Import-Module -Name Pode.Web

Start-PodeServer {
    Add-PodeEndpoint -Address * -Port 8090 -Protocol Http -Name User
    Use-PodeWebTemplates -Title 'test' -Theme Dark
}