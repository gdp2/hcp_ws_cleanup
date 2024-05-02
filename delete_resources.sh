ws_list=$(cat ws_data.csv)

for ws in $ws_list;
do
curl --location "https://app.terraform.io/api/v2/workspaces/$ws" \
--header "Authorization: Bearer $HCP_TOKEN" | jq -r '.data.attributes'


    export HCP_WORKSPACE=$ws
    envsubst < main.tf.tmpl > main.tf
    # terraform init
    # terraform apply
done