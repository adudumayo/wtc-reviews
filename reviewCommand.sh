#!/bin/bash

command="wtc-lms reviews"

notDesiredOutput="listing reviews failed because Request(reqwest::Error { kind: Decode, source: TimedOut })"

while true; do
    output=$($command)
    echo "$output">output.txt

    if [[ $output == *"$notDesiredOutput"* ]]; then
        echo "Running the command again..."
        output=$($command)
    else
        uuid=$(python3 ./uuidFinder.py)
        echo "Now reviewing : $uuid" && echo

        echo "Looking for the best comment for : $uuid ..." && sleep 2
        add_comment="wtc-lms add_comment $uuid \"Beautiful\""
        echo "Now running $add_comment" && echo && sleep 2
        echo $($add_comment)

        echo "Completing review for : $uuid"
        complete_review="wtc-lms complete_review $uuid"
        echo "Now running $complete_review" && echo && sleep 2
        echo $($complete_review)

        break
    fi
done

