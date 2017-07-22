This demo presents a basic Terraform configuration.
### Initialise your Terraform configuration
* export your Digital Ocean Token: `export DO_TOKEN=<your_token>`
* initialise Terraform: `terraform init`
### Create the infrastructure
* prepare the execution plan: `terraform plan -var "do_token=$DO_TOKEN"`
* create the resources: `terraform apply -var "do_token=$DO_TOKEN"`
* once the resources have been created, grab the Droplet IP and check you can login: `ssh root@<droplet_ip>`
The workflow is then:
* modify the configuration files
* check the execution plan with `terraform plan`
* create the resources with `terraform apply` when you're happy with the plan
* repeat
