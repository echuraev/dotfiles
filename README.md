# My dotfiles

This repository included almost all my configurations for different programs on Linux and Mac OS.

## Installation
Just clone this repository to your home directory

## Configurations
### Ack
I used to use ack for search and have a small [config file](.ackrc) for it.

But now I prefer to use ***ripgrep*** because it is really faster.

### Emacs
I tried to use Emacs as my primary text editor but I returned to use Vim. Here is just some of my old configurations for Emacs.

### Environment configurations
By default my .bashrc will check if zsh is installed then zsh will be started in oposit case you will work in bash.
Your personal config you should write to .bashrc.global or .bashrc.local. In _global_ file all settings will be in all your configurations.
In _local_ file there is settings only for specific machine.

### GDB Dashboard
Usially I use Vim and Conque GDB plugin for debug. But sometimes when I don't like to run Vim bui I want to have nice looking GDB, I use GDB Dashboard.
Just copy .gdbinit to your home directory.

### Ripgrep
It is really fast. See here: https://github.com/BurntSushi/ripgrep

### Vim
I use VIM as my primary text editor. My Vim configuration with description you can find [here](.vim/). It works on Linux, Mac and Windows.

### Zsh
In zsh I use [zplug](https://github.com/zplug/zplug) as my plugins manager. Also I use vim mode for editing commands.

## Some tips
### Mac OS
<details>
<summary><strong>Auto-mount NTFS volumes in read-write mode</strong></summary>
<br>

I found this information here: https://github.com/osxfuse/osxfuse/wiki/NTFS-3G

_Short instruction:_
1. Install NTFS-3G from Homebrew: `brew install ntfs-3g`
2. Replace `/sbin/mount_ntfs` with the version provided by NTFS-3G. 
May be it will not be possible due System Integrity Protection. So, you have to disable it.

   You need to reboot your mac and press `⌘+R` when booting up. Then go into _Utilities > Terminal_ and type the following commands:
   ```
   csrutil disable
   reboot
   ```
3. To replace Apple's NTFS mount tool with the one provided by NTFS-3G execute the following commands in Terminal.
   This will back up the original mount tool to `/Volumes/Macintosh HD/sbin/mount_ntfs.orig`.
   ```
   sudo mv "/Volumes/Macintosh HD/sbin/mount_ntfs" "/Volumes/Macintosh HD/sbin/mount_ntfs.orig"
   sudo ln -s /usr/local/sbin/mount_ntfs "/Volumes/Macintosh HD/sbin/mount_ntfs"
   ```
</details>
<details>
<summary><strong>Manage your Mac Applications</strong></summary>
<br>

I found very nice application that can help you to manage your Apps (e.g. total remove an application): https://nektony.com/mac-app-uninstaller
</details>
