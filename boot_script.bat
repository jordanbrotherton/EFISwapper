@echo off
bcdedit.exe /set {fwbootmgr} displayorder {LINUX-GUID} /addfirst
shutdown -r -t 0