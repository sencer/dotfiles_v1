#!/bin/zsh

if [[ $1 == fix ]]; then
  echo "Trying to force remove sshfs connections."
  servers=( $(pgrep -a sshfs|cut -d' ' -f3) )
  for server in $servers; do
    fusermount -u -z $HOME/${server%:}
    rmdir $HOME/${server%:}
  done
  pkill -9 sshfs
  exit 1
fi

typeset -xT SERVERLIST serverlist
local server=$1

if [[ ${serverlist[(r)$server]} != $server ]]; then
  echo "Server $server is not found in the ssh config file."
  exit -1
fi

if mountpoint -q $HOME/$server; then
  if fusermount -z -u $HOME/$server; then
    rmdir $HOME/$server
    echo "$server successfully unmounted."
  fi
else
  if [[ -e $HOME/$server ]]; then
    if [[ ! -d $HOME/$server ]]; then
      echo "$HOME/$server is not a directory."
      exit -1
    fi
    if [[ "$(ls -A $HOME/$server)" ]]; then
      echo "The folder $HOME/$server is not empty."
      exit -1
    fi
  fi
  mkdir -p $HOME/$server
  local sshfs_options=(
    auto_cache
    reconnect
    transform_symlinks
    follow_symlinks
    workaround=rename
    idmap=user
    cache_timeout=7200
    attr_timeout=7200
    ssh_command="ssh -S none"
  )
  if sshfs $server: $HOME/$server -o${(j:,:)sshfs_options}; then
    echo "$server successfuly mounted"
  else
    rmdir $HOME/$server
  fi
fi