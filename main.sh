#!/bin/bash
rm -f All
links=(
    "https://raw.githubusercontent.com/Epodonios/v2ray-configs/main/All_Configs_Sub.txt"
    "https://raw.githubusercontent.com/peasoft/NoMoreWalls/master/list_raw.txt"
    "https://raw.githubusercontent.com/LalatinaHub/Mineral/master/result/nodes"
    "https://raw.githubusercontent.com/Barabama/FreeNodes/master/nodes/wenode.txt"
    "https://raw.githubusercontent.com/Barabama/FreeNodes/master/nodes/merged.txt"
    "https://raw.githubusercontent.com/Barabama/FreeNodes/master/nodes/kkzui.txt"
    "https://raw.githubusercontent.com/mahdibland/V2RayAggregator/master/sub/sub_merge.txt"
    "https://raw.githubusercontent.com/chengaopan/AutoMergePublicNodes/master/list_raw.txt"
    "https://raw.githubusercontent.com/HakurouKen/free-node/main/public"
    "https://raw.githubusercontent.com/MrMohebi/xray-proxy-grabber-telegram/master/collected-proxies/row-url/actives.txt"
    "https://raw.githubusercontent.com/barry-far/V2ray-Configs/main/All_Configs_Sub.txt"
    "https://raw.githubusercontent.com/asakura42/vss/master/output.txt"
    "https://raw.githubusercontent.com/MrMohebi/xray-proxy-grabber-telegram/master/collected-proxies/row-url/all.txt"
)

for link in "${links[@]}"; do
    curl -s "$link" >> nodes
    echo "Downloaded $link"
done

chmod +x ./main64.sh

bash ./main64.sh

base64 -d nodes64 > base64node

echo "All downloads completed!"

extract_lines() {
    local file="$1"
    grep -E '^.*(vmess|vless|trojan|ss)://' "$file"
}


extract_lines "nodes" >> extracted_nodes
extract_lines "base64node" >> extracted_nodes64

echo "Extraction completed!"

cat extracted_nodes extracted_nodes64 > account

sort -u account > All

# chmod +x ./bin/lite-linux

# ./lite-linux -config ./bin/config.json -test account
