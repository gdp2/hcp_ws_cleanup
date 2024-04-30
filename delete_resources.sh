ws_list=$(cat ws_data.csv)

for ws in $ws_list;
do
    export HCP_WORKSPACE=$ws
    envsubst < main.tf.tmpl > main.tf
    terraform init
    terraform plan
done