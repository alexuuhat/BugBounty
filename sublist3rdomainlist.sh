#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 domainlist"
  exit 1
fi

input="$1"
output="sublist3r.txt"

if [ ! -f "$input" ]; then
  echo "File $input not found!"
  exit 1
fi

while IFS= read -r domain
do
  echo "Running Sublist3r for $domain" | tee -a "$output"
  sublist3r -d "$domain" -v -b | tee -a "$output"
  echo "------------------------------------" | tee -a "$output"
done < "$input"

echo "Output saved in $output"
