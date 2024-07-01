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
        uuid=$(python3 ./uuidFinder.py)
        add_comment="wtc-lms add_comment $uuid \"Beautiful\""
        echo $($add_comment)
        complete_review="wtc-lms complete_review $uuid"
        echo $($complete_review)
        break
    fi
done

