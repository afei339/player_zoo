#!/bin/bash

trap 'kill $(jobs -p)' SIGINT SIGTERM EXIT

python -m visdom.server -logging_level WARNING &
pids="$pids $!"
sleep 2

python $@ &
pids="$pids $!"

wait -n $pids
