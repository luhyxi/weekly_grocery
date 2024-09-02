#!/bin/bash

file_path="./ingredients.json"

result="Lista:\n"

categories=$(jq -r 'keys[]' "$file_path")

for category in $categories; do
    result+="$category:\n"
    items=$(jq -r ".${category}[]" "$file_path" | shuf -n 3)
    for item in $items; do
        result+="  - $item\n"
    done
done

echo -e "$result"
