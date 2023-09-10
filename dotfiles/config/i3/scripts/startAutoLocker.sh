#!/usr/bin/env bash

killall -q xautolock

sleep 1

xautolock -time 10 -locker "~/.config/i3/scripts/lock.sh" -detectsleep -notify 30 -notifier "notify-send 'Locking screen in 30 seconds'" &
