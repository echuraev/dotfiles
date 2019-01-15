# Mutt configuration

For [Mutt](http://www.mutt.org/) installing I wrote Ansible script. You can find it [here](https://github.com/echuraev/Ansible/blob/master/roles/mutt/tasks/main.yml). When you run it it will install all necessary programs.

I use the following workflow for working with mutt:
* **mutt** - text-based mail client for Unix operating systems.
* **isync/mbsync** -  is a command line application which synchronizes mailboxes.
* **imapfilter** - 
* **msmtp** - 
* **notmuch** - 

## Mutt settings
TODO: Describe about settings.mutt.local.

## isync/mbsync configuration
You can copy file `~/.mbsyncrc.example` to `~/.mbsyncrc` and replace there all
settings to you personal configuration. You can search `TODO` word in this file
and read comments for understanding what should you do.

### Keeping encrypted password
For keeping passwords it is possible to use encrypted file and `gpg`.

First generate a GnuPG key, and then [create the encrypted password 
file](http://f-koehler.github.io/posts/2015-03-17-offlineimap-msmtp-gnupg.html).

```shell
$ gpg --full-gen-key
# An extra space in front of this command, so it doesn't get stored in the
# shell's history file
$  echo 'your_password123' | gpg --encrypt --recipient 'Alex Pearce' -o /path/to/password-ACCOUNT.gpg
```

Then set the `PassCmd` in the `mbsyncrc` to use `gpg2`:

```
PassCmd "gpg2 -q --for-your-eyes-only --no-tty -d ~/.password-ACCOUNT.gpg"
```

