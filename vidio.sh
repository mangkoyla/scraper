linksvidio=(
    "https://mangkoyla.vercel.app/api/raw?vpn=vmess,vless,trojan&mode=cdn&cdn=quiz.int.vidio.com&nw=ws"
    )

for linksvidio in "${linksvidio[@]}"; do
    curl -s "$linksvidio" >> nodesvidio
    echo "Downloaded $linksvidio"
done
