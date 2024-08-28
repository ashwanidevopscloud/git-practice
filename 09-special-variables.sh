#!/bin/bash
echo "all vaiables passed to the script:$@"
echo "nmber of vaiables passed::$#"
echo "scipt name::$0"
echo "crrent pesent working directory ::$PWD"
echo "home directoy of crent ser:$HOME"
echo "PID of scipt ececting now:$$"
sleep 20000 &
echo "PID of last backgond command ::$!"