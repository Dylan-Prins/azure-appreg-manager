Import-Module -Name Pode, Pode.Web

$env:UserPrincipalName = "dylan.prins@insparklabs.nl"

Start-PodeServer {
    Add-PodeEndpoint -Address * -Port 443 -Protocol Https -Name User -SelfSigned
    Use-PodeWebTemplates -Title 'test' -Theme Dark

    Add-PodeWebPage -Name 'AppRegistrations' -Icon 'Settings' -ScriptBlock {
        New-PodeWebCard -Content @(
            New-PodeWebTable -Name 'App Registrations' -DataColumn AppId -Click -ScriptBlock {
                Get-MgApplication -All | ForEach-Object {
                    $owners = Get-MgApplicationOwnerAsUser -ApplicationId $_.Id | Where-Object { $_.UserPrincipalName -eq $env:UserPrincipalName }
                    if ($null -ne $owners) {
                        [PSCustomObject]@{
                            Name   = $_.DisplayName
                            AppId  = $_.AppId
                            Owners = $Owners.DisplayName
                        }
                    }
                }
            } -ClickScriptBlock {
                [PSCustomObject]@{
                    Name   = 'stuf'
                    AppId  = 'more stuf'
                    Owners = 'even more stuf'
                }
            }
        )
    }
}