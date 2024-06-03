#!/bin/sh
cd lb/;
sudo mount -t debugfs none /sys/kernel/debug;
sudo make xdp_init;
sudo cat /sys/kernel/debug/tracing/trace_pipe
