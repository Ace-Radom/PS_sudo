Function _sudo {
    if ( ( $args.Length -eq 0 ) -or ( ( $args.Length -eq 1 ) -and ( $args[0] -eq "/?" ) ) )
    {
        Write-Output "`nSudo Command for Windows PowerShell`n`nTry to run commands with admin privileges`n"
        Write-Output "Usage: sudo [/? | /p [/h]]"
        Write-Output "Usage: sudo [/b] <commands>`n"
        Write-Output "No Options  show this help page (it is same as typing in /?)"
        Write-Output "/?          show this help page (it is same as not typing in any options)"
        Write-Output "/p          open one powershell window with admin privileges"
        Write-Output "/h          open the new powershell window in current directory (it can only be used with /p)"
        Write-Output "/b          run commands in background"
        Write-Output "<commands>  commands need to be run with admin privileges`n"
    } # help page
    elseif ( $args[0] -eq "/p" ) 
    {
        if ( $args[1] -eq "/h" )
        {
            Start-Process "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Verb runAs -ArgumentList ( "-NoExit" , "cd $pwd" )
#           Start-Process powershell -Verb runAs -ArgumentList ( "-NoExit" , "cd $pwd" )
        } # start in current directory
        else
        {
            Start-Process "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Verb runAs -ArgumentList ( "-NoExit" , "-NoLogo" )
#           Start-Process powershell -Verb runAs
        }
    } # start a powershell page with admin privileges
    elseif ( ( $args.Length -gt 1 ) -and ( $args[0] -eq "/b" ) )
    {
        $ss = "cd $pwd ; " + $args[1..$args.Length]
        Start-Process "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Verb runAs -WindowStyle Hidden -ArgumentList ( $ss )
#       Start-Process powershell -Verb runAs -WindowStyle Hidden $ss
    } # run in background
    else
    {
        $ss = "$args ; pause"
        Start-Process "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Verb runAs -ArgumentList ( $ss )
#       Start-Process powershell -Verb runAs $ss
    } # run command (default)

# Normally, powershell will be installed under "C:\Windows\System32\WindowsPowerShell\v1.0"
#
# To avoid conflicts caused by the presence of multiple powershell.exe in the system environment variables, 
# the default powershell start path of this script is set to the absolute path of the default powershell installation path
#
# If this script cannot start powershell with this default path, try the second Start-Process command

}
Set-Alias sudo _sudo