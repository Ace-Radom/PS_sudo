Function _sudo {
    if ( ( $args.Length -eq 0 ) -or ( ( $args.Length -eq 1 ) -and ( $args[0] -eq "/?" ) ) )
    {
        Write-Output "`nSudo Command for Windows PowerShell`n`nTry to run commands with admin privileges`n"
        Write-Output "To Use: sudo [/? | /p | <commands>]`n"
        Write-Output "/?          show this help page"
        Write-Output "/p          open one powershell window with admin privileges"
        Write-Output "<commands>  run these commands with admin privileges`n"
    } # help page
    elseif ( ( $args.Length -eq 1 ) -and ( $args[0] -eq "/p" ) ) 
    {
        Start-Process "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Verb runAs
#       Start-Process powershell -Verb runAs
    } # start a powershell page with admin privileges
    else
    {
        $ss = "cd $pwd ; $args ; pause"
        Start-Process "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Verb runAs $ss
#       Start-Process powershell -Verb runAs $ss
    } # run command

# Normally, powershell will be installed under "C:\Windows\System32\WindowsPowerShell\v1.0"
#
# To avoid conflicts caused by the presence of multiple powershell.exe in the system environment variables, 
# the default powershell start path of this script is set to the absolute path of the default powershell installation path
#
# If this script cannot start powershell with this default path, try the second Start-Process command

}
Set-Alias sudo _sudo