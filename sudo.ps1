Function _sudo {
    $ss = "cd $pwd ; $args ; pause"
    Start-Process "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -Verb runAs $ss
#   Start-Process powershell -Verb runAs $ss

# Normally, powershell will be installed under "C:\Windows\System32\WindowsPowerShell\v1.0"
#
# To avoid conflicts caused by the presence of multiple powershell.exe in the system environment variables, 
# the default powershell start path of this script is set to the absolute path of the default powershell installation path
#
# If this script cannot start powershell with this default path, try the second Start-Process command

}
Set-Alias sudo _sudo