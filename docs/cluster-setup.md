# Cluster Setup

## SSH Tricks (Keys & Aliases)

Repetitively typing out login credentials is tedious:

```bash
ssh netid@cc-login.campuscluster.illinois.edu
# password
```

There are two tricks that void this and also make locally
launched script jobs possible.

- Public/Private keys
    - Passwordless login
- SSH Config
    - Alias connection names

Instead of entering a password, the local computer can submit a private key to be
verified by a server. This is a bit more secure and avoids the hassle of constantly
typing passwords.

#### Generating an SSH Key

```bash
## Run:
ssh-keygen -t rsa -C "netid@illinois.edu"
## Respond to:
# Enter file in which to save the key (/home/demo/.ssh/id_rsa): # [Press enter]
# Enter passphrase (empty for no passphrase): # Write short password
```

#### Copy SSH Key to Server

```bash
## Run:
ssh-copy-id netid@cc-login.campuscluster.illinois.edu
```

#### Setting up a Configuration

Add^[**Note:** This assumes a default location is used for the SSH key. If there is a custom SSH key location add `IdentityFile ~/.ssh/sshkeyname.key` after the `User` line.]
the following to `~/.ssh/config`^[**Replace** `netid` with your netid.]

```bash
Host icc
    HostName cc-login.campuscluster.illinois.edu
    User netid
```
