#!/usr/bin/env bash

# increases or decreases the volume of the application given in argument 1
# by the amount in percent given in argument 2
# eg. <scriptname> spotify -5 decreases the volume of spotify by 5%
# increasing the volume is limited to 100%

PERCENT=$2
APPNAME=$1
APP=$(pactl list sink-inputs | tr '\n' '\r' | perl -pe 's/Sink Input #([0-9]+).+?Volume:.+?([0-9]+)%.+?application\.name = \"([^\r]+)\".+?(?=Sink Input|$)/\3 \1 \2\n/g' | grep "$APPNAME")

while IFS= read -r line
do
    VOL=$(echo "$line" | cut -d ' ' -f 3)
    SINK=$(echo "$line" | cut -d ' ' -f 2)
    COMMAND="pactl set-sink-input-volume $SINK"
    if [ "$PERCENT" -gt 0 ]
    then
        if [ "$VOL" -lt 100 ]
        then
            if [ "$((VOL + PERCENT))" -gt 100 ]
            then
                eval "$COMMAND 100%"
            else
                eval "$COMMAND +$PERCENT%"
            fi
        fi
    else
        eval "$COMMAND $PERCENT%"
    fi
done <<< "$APP"
