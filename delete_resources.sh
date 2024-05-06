ws_list=$(cat ws_data.csv)
# remove old terraform files
rm -rf .terraform
i=1
sp="/-\|"

for ws in $ws_list; do
    # statefile_url=$(curl -s --location "https://app.terraform.io/api/v2/workspaces/$ws/current-state-version" \
    #     --header "Authorization: Bearer $HCP_TOKEN" | jq -r '.data.attributes."hosted-state-download-url"')
    # echo $statefile_url
    # curl --location $statefile_url \
    # --header "Authorization: Bearer $HCP_TOKEN" -o terraform.tfstate
    printf "\b${sp:i++%${#sp}:1} $ws"
    export HCP_WORKSPACE=$ws
    envsubst <main.tf.tmpl >main.tf

    terraform init
    terraform plan -var-file="terraform.tfvars" -no-color > outputs/$ws.plan || echo $ws >> errored_ws.csv
done
