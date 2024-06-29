#!/bin/bash

command="wtc-lms reviews"

notDesiredOutput="listing reviews failed because Request(reqwest::Error { kind: Decode, source: TimedOut })"

while true; do
    # Get the output
    output=$($command)

    echo "$output">output.txt

    # Check if the output contains the notDesiredOutput string 
    if [[ $output == *"$notDesiredOutput"* ]]; then
        echo "Running the command again..."
        output=$($command)
    else
        echo "Perfecto!"
        break
    fi
done
