#!/bin/bash

# Function to run the infinite while loop

run_infinite_loop() {
    while true; do
        # Replace this line with the commands you want to run in the loop
        echo "Running loop iteration..."
        sleep 1  # Adding a sleep to avoid overwhelming the terminal with output
    done
}

export -f run_infinite_loop

# Open a new terminal and run the infinite loop inside it
gnome-terminal -- bash -c "run_infinite_loop; exec bash"

