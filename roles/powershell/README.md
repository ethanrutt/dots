### Powershell
* linking a powershell config requires a little bit of extra work
* check the default places that powershell looks for a profile with
```powershell
PS> $profile | select *
```
* to change where powershell looks for a profile, you have to use regedit to change a certain key
* the key is "Personal" under "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
* Powershell looks for the directory under the key `Personal + \WindowsPowershell\*` so by setting that value to the path you want, you are setting it up correctly

