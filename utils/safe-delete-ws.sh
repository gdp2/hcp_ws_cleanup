ws_data_csv=$1

for ws in $(cat $ws_data_csv);
do
echo "https://app.terraform.io/api/v2/workspaces/$ws/actions/safe-delete"
curl --location --request POST "https://app.terraform.io/api/v2/workspaces/$ws/actions/safe-delete" \
--header 'Content-Type: application/vnd.api+json' \
--header "Authorization: Bearer $HCP_TOKEN";
done