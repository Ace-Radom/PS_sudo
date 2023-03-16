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
sudo [/? | /p [/h]]
sudo [/b | /admin] <commands>

Examples:
  sudo /b notepad.exe
  sudo /admin sqlite3 E:/test.db
```

- Using `/?` to show help page.

- Using `/p` to open a powershell window with admin privileges.

    - Using `/h` to open the new powershell window in current directory

- Using `/b` to run commands in background.

- Using `/admin` to try to run one application as administrator

If you are using sudo directly to run commands, sudo will automatically access the current directory and run all commands you give.

That means, you don't need to set the working directory of the new powershell window with `cd <CurrentDirectory>`, when you need to do so.

**For example**:

I've just used cmake configure a cxx project, now I want to install it with `make install` to the default install path, which is normally `C:\Program Files (x86)`, and I need admin privileges now.

In this situation, you don't need to use sudo like:

```powershell
sudo "cd $pwd; make install"
```

but just:

```powershell
sudo make install
```

**Last but not least**:

If you want to run more than one commands at the same time with sudo, you must use sudo like that:

```powershell
sudo "make; make install"
# 'make' and 'make install' will all be run with admin privileges
```

Be 100% sure that don't use sudo like that:

```powershell
sudo make; make install
# only 'make' will be run with admin privileges
```

Powershell will divide this line into two commands which are `sudo make` and `make install`, and `make install` will not be run with admin privileges.