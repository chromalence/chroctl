#!/usr/bin/env bash 

echo "installing nct tools to /usr/local/bin.."
sudo install -Dm755 nct/* /usr/local/bin/
echo "done. try nct help"
