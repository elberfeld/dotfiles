#!/usr/bin/env bash

echo "Setting SSH_AUTH_SOCK=/tmp/wincrypt-hv.sock"
export SSH_AUTH_SOCK=/tmp/wincrypt-hv.sock

echo "check if SSH_AUTH_SOCK exists .."
ss -lnx | grep -q $SSH_AUTH_SOCK

if [ $? -ne 0 ]; then
  echo "recreating SSH_AUTH_SOCK .."
  rm -f $SSH_AUTH_SOCK
  (setsid nohup socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork SOCKET-CONNECT:40:0:x0000x33332222x02000000x00000000 >/dev/null 2>&1)
fi

echo "loaded SSH Keys: "
ssh-add -l
