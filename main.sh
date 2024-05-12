#!/bin/bash

links=(
    "https://raw.githubusercontent.com/Epodonios/v2ray-configs/main/All_Configs_Sub.txt"
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

links64=(
    "https://raw.githubusercontent.com/mangkoyla/v2ray/master/v2ray"
    "https://raw.githubusercontent.com/Flik6/getNode/main/v2ray.txt"
    "https://raw.githubusercontent.com/peasoft/NoMoreWalls/master/list_raw.txt"
    "https://hueco.link/v.txt"
    "https://github.com/Vauth/node/raw/main/Main"
    "https://github.com/Vauth/node/raw/main/Master"
    "https://raw.githubusercontent.com/firefoxmmx2/v2rayshare_subcription/main/subscription/vray_sub.txt"
    "https://raw.githubusercontent.com/0x24a/FreeNodes/main/subs/main.txt"
    "https://raw.githubusercontent.com/Surfboardv2ray/TGParse/main/splitted/mixed"
    "https://raw.githubusercontent.com/mheidari98/.proxy/main/all"
    "https://raw.githubusercontent.com/soroushmirzaei/telegram-configs-collector/main/splitted/mixed"
)

for link in "${links[@]}"; do
    curl -s "$link" >> nodes
    echo "Downloaded $link"
done

for link64 in "${links64[@]}"; do
    curl -s "$link64" >> nodes64
    echo "Downloaded $link64"
done

echo "All downloads completed!"

extract_lines() {
    local file="$1"
    grep -E '^.*(vmess|vless|trojan)://' "$file"
}

base64 -d nodes64 > base64node

extract_lines "nodes" >> extracted_nodes
extract_lines "base64node" >> extracted_nodes64

echo "Extraction completed!"

cat extracted_nodes base64node > account

sort -u account > All

# chmod +x ./bin/lite-linux

# ./bin/lite-linux -config ./bin/config.json -test All

# links=$(jq -r '.nodes | map(select(.avg_speed > 0)) | .[].link' output.json)

# echo "$links" > url_test

# echo "Links with avg_speed > 0 have been saved to url_test file."
