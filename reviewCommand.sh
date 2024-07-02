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
        # Getting the uuid
        uuid=$(python3 ./uuidFinder.py)

        if [[ $uuid == "Not a uuid" ]]; then
            echo "ALL REVIEWS COMPLETE"
            break
    fi

    # Accepting review
    lms_accept="wtc-lms accept $uuid"
    echo "lms_accept">output.txt
    acceptanceStatus=$(python3 ./acceptor.py $uuid)

    if [[ $acceptanceStatus == "accepted" ]]; then
        echo "Now reviewing : $uuid" && echo

        # Adding the comment
        echo "Looking for the best comment for : $uuid ..." && echo && sleep 2
        add_comment="wtc-lms add_comment $uuid \"Nice\""
        echo "Now running $add_comment" && echo && sleep 2
        echo $($add_comment) && echo && sleep 2

        # Completing review
        echo "Completing review for : $uuid"
        complete_review="wtc-lms complete_review $uuid"
        echo "Now running $complete_review" && echo && sleep 2
        echo $($complete_review)
    else
        echo "You can't review $uuid, looking for another review..." && echo && sleep 3
    fi
    
done

