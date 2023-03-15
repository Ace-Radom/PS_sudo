# PS_sudo
sudo-like command for Windows Powershell

## Installation

1.  You need a `$profile` for Powershell.
    
    If you never create it, you may create it in powershell like that:

    ```powershell
    if (!(test-path $profile)) { new-item $profile -itemtype file -force }
    ```

2.  Open this `$profile`.

3.  Add the following line and save this file:

    ```powershell
    . $path_to_this_project\sudo.ps1
    ```

    Same, you can just copy all things in sudo.ps1 and paste them into your `$profile`

4.  Restart powershell.

If powershell cannot load your `$profile`, that may be because the executionpolicy of powershell is set to restricted.

You can get your executionpolicy with this command:

```powershell
Get-ExecutionPolicy
```

To reset your executionpolicy, you need to start a powershell in Admin, and run:

```powershell
Set-ExecutionPolicy RemoteSigned
```

Then restart powershell. Your `$profile` should be successfully loaded.

## How to use

```
sudo [/? | /p | <commands>]
```

It will open a new powershell window, access the path where you call sudo, and run all following commands.

Using `/?` to show help page.

Using `/p` to open a powershell window with admin privileges.