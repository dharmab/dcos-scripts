#!/bin/bash
token=$1
dcos_urls=$(cat clusters.txt)
for dcos_url in $dcos_urls; do
	dcos config set core.dcos_url "$dcos_url"
	echo "$token" | dcos auth login
	cluster_name=$(echo "$dcos_url" | cut -f3 -d '/' | cut -f1 -d '.')
	bash ./generate-dcos-inventory.sh "$cluster_name.ini"
done
