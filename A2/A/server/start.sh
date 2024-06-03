#!/bin/sh
cd server/;
sudo mount -t debugfs none /sys/kernel/debug;
if [ $1 -gt 0 ]
then
    echo "Insert packet dropper";
    sudo make xdp_init;
    sudo cat /sys/kernel/debug/tracing/trace_pipe & python3 server.py;
else
    echo "Bare Server";
    python3 server.py;
fi
