#!/bin/bash

counter=0
number_of_tries=5

while [ $counter -lt $number_of_tries ]; do
    input_file="dec_flag$counter.txt"
    output_file="dec_flag$((counter+1)).txt"

    openssl enc -d -base64 -in "$input_file" -out "$output_file"
    echo "Contents of $output_file:"
    cat "$output_file"

    ((counter++))
done