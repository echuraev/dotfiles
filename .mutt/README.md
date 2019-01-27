# Mutt

For [Mutt](http://www.mutt.org/) installing I wrote Ansible script. You can find it [here](https://github.com/echuraev/Ansible/blob/master/roles/mutt/tasks/main.yml). When you run it it will install all necessary programs.

I use the following workflow for working with mutt:
* **[mutt](http://www.mutt.org/)** - text-based mail client for Unix operating systems.
* **[isync/mbsync](http://isync.sourceforge.net/)** -  is a command line application which synchronizes mailboxes.
* **[msmtp](http://msmtp.sourceforge.net/)** - is a very simple and easy to use SMTP client with fairly complete `sendmail` compatibility.
* **[imapfilter](https://github.com/lefcha/imapfilter/)** - is a mail filtering utility.
* **[notmuch](https://notmuchmail.org/)** - 

Some OS specific dependencies:
* Mac OS:
    * [terminal-notifier](https://github.com/julienXX/terminal-notifier): For notifications.

## Configuration
### Mutt settings
TODO: Describe about settings.mutt.local.

### isync/mbsync configuration
You can copy file `~/.mbsyncrc.example` to `~/.mbsyncrc` and replace there all
settings to you personal configuration. You can search `TODO` word in this file
and read comments for understanding what should you do.

#### Keeping encrypted password
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

### msmtp configuration
You can copy file `~/.msmtprc.example` to `~/.msmtprc` and replace all settings
to your personal configuration.
After configuration you can check that `msmtp` is working by using the following
command:
```bash
echo "hello there username." | msmtp -a default account@example.com
```

For working with mutt without asking password from `gpg` every time (in this
case msmtp won't work) it is better to use `gpg-agent`.

#### gpg-agent configuration
`gpg-agent` is mostly used as daemon to request and cache the password for the
keychain.

You have to increase stash time for passwords. It helps to avoid password
entering for every 10 minutes. You have to add the following lines to
`~/.gnupg/gpg-agent.conf`:
```
default-cache-ttl 34560000
max-cache-ttl 34560000
```
Now password will be cached for 34560000 seconds (400 days). Get it from
[here](https://superuser.com/questions/624343/keep-gnupg-credentials-cached-for-entire-user-session).

* [ ] Write about configuring password GUI prompt by using `pinentry-program`.
    Find more
    [here](http://code.lexarcana.com/posts/text-based-email-setup-with-mbsync-and-mu.html).

### imapfilter configuration
**imapfilter** uses the Lua programming language as a configuration and
extension language.  Lua is a simple language and you can use
[Learn Lua in Y minutes](https://learnxinyminutes.com/docs/lua/) such as quick
guide.

I implemented `login()` function that produce automatic login to the imap server
by the credentials from `~/.mbsyncrc`.

## Running mutt
You can use `email` function from `~/.bashrc.global` it will run mutt in tmux
session with sync script in another window.

## Inspired
Inspired by awesome vim screencasts by Greg Hurrell (@wincent):
* [Vim screencast #49: Sending email with vim](https://www.youtube.com/watch?v=VBLh56J89do)
* [Vim screencast #50: Email demo](https://www.youtube.com/watch?v=19h34aP-fN4)
* [Vim screencast #51: Composing email](https://www.youtube.com/watch?v=9zffUQsbxgE)
* [Vim screencast #52: Viewing email with Vim](https://www.youtube.com/watch?v=YH3MnY52e9c)
* [Vim screencast #53: Email architecture](https://www.youtube.com/watch?v=obY1um6ehDM)
* [Vim screencast #56: HTML email](https://www.youtube.com/watch?v=blqvk-eth3E)

