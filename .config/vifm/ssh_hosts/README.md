# SSH hosts directory

This directory is dedicated for predefined ssh servers.
You should create here files with extension `.ssh`. All these files should
contain settings for connection. Format of `.ssh` file:
```
[user@]host:/path
```
vifm will create ssh connection to this host when you'll try to open this file.

