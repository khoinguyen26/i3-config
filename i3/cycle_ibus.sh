#!/bin/bash

# List of input methods to cycle through
engines=("xkb:us::eng" "Unikey")

# Get the current input engine
current_engine=$(ibus engine)

# Find the index of the current engine in the array
next_index=0
for i in "${!engines[@]}"; do
  if [[ "${engines[$i]}" == "$current_engine" ]]; then
    next_index=$(( (i + 1) % ${#engines[@]} ))
    break
  fi
done

# Set the next input engine
ibus engine "${engines[$next_index]}"

