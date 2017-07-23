This demo creates a **single Droplet** to illustrate a basic Terraform configuration.
### Initialise the configuration
* export your Digital Ocean Token: `export TF_VAR_do_token=<your_token>`
* initialise Terraform: `terraform init`
### Create the infrastructure
* prepare the execution plan: `terraform plan`
* create the resources: `terraform apply`
* once the resources have been created, grab the Droplet IP and check you can login: `ssh root@<droplet_ip>`
### Modify the infrastructure
* modify the configuration files
* run a `plan` to check the changes that would occur and run an `apply` when you're happy with these changes
* repeat
### Destroy the infrastructure
* delete all resources created by Terraform with `terrafom destroy`
