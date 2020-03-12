#!/bin/bash

if [[ $1 == "cn" || $1 == "sg" ]]; then
  cp -rf ~/.aws/$1/* ~/.aws/
fi

cat ~/.aws/config
