import requests
import sys
import os
org = os.environ['HCP_ORG'] 
token = os.environ['HCP_TOKEN']
sp = "/-\\|"
workspace = []
workspace_name = []
resource_count = []
created_at = []
def fetch_data(page):
    url = f"https://app.terraform.io/api/v2/organizations/{org}/workspaces?page[number]={page}&page[size]=80&search[wildcard-name]=ws-*"
    headers = {"Authorization": f"Bearer {token}"}
    response = requests.get(url, headers=headers)
    response.raise_for_status()
    return response.json()

def main():
    next_page = 1
    with open("ws_details.csv", "w") as f:
        f.write("")  # Clearing the file

    while True:
        raw_data = fetch_data(next_page)
        next_page = raw_data['meta']['pagination']['next-page']
        total_page = raw_data['meta']['pagination']['total-pages']

        for workspace_data in raw_data['data']:
            workspace.append(workspace_data['id'])
            workspace_name.append(workspace_data['attributes']['name'])
            resource_count.append(workspace_data['attributes']['resource-count'])
            created_at.append(workspace_data['attributes']['created-at'])

        if next_page is None:
            break

    print("\n")

    with open("ws_details.csv", "w") as f:
        for i in range(len(workspace)):
            f.write(f"{workspace[i]},{workspace_name[i]},{resource_count[i]},{created_at[i]}\n")

if __name__ == "__main__":
    main()
