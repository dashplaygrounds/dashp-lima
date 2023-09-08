#!/bin/bash
# https://medium.com/tech-brant/launch-virtual-machines-quickly-and-easily-on-your-mac-or-linux-with-this-tool-10cc0ed44ff1

brew install lima
limactl start --name=jammy ubuntu-lts.yaml
limactl shell jammy
