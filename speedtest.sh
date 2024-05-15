#!/bin/bash

nodes_file="All"
blacklist_file="blacklist.txt"
url_test_file="Best-Ping"
chmod +x ./bin/xrayknife

count=0

while IFS= read -r url
do
    ((count++))
    echo "Testing network for account-$count"
    result=$(./bin/xrayknife net http <<< "$url")

    if [[ $result == *"Config didn't respond!"* ]]; then
        echo "URL = $url has Failed!"
        echo "$url" >> "$blacklist_file"
    elif [[ $result == *"Real Delay:"* ]]; then
        echo "URL = $url has Success"
        echo "$url" >> "$url_test_file"
    fi

    echo "------------------------------------"
done < "$nodes_file"