#!/bin/sh
echo "Setup auth keys"
echo "command=\"LANG=C /scripts/rrsync -ro /sync/\",no-agent-forwarding,no-port-forwarding,no-pty,no-user-rc,no-X11-forwarding $SSH_PUBKEY" > /home/rsync/.ssh/authorized_keys
echo > /home/rsync/.ssh/authorized_keys2

SSHD_PORT=${SSHD_PORT:-2222}

mkdir -p /run/sshd
exec /usr/sbin/sshd -De -p $SSHD_PORT
