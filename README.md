# rsync-container

Designed to take an ssh-key and allow it read-only
rsync access to backup a volume to a remote system.

It ends up with a user 'rsync', with an entry in
~/.ssh/authorized_keys like:

```
command="/usr/bin/rrsync -ro /sync/",no-agent-forwarding,no-port-forwarding,no-pty,no-user-rc,no-X11-forwarding ssh-ed25519 XXX...
```

The idea is you mount your volume(s) under /sync and it will recursively
back them up. It was designed to run in a Kubernetes environment
and allow access to the various backup volumes.

It takes a environment-variable ```SSH_PUBKEY``` and places
it in the ~/.ssh/authorized_keys file.

You may wish to run something like this:
```
docker run -p 2222:22 -e "SSH_PUBKEY=ssh-ed25519 AAAAC3NzaC1lZWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW" -d rsync:latest
```
