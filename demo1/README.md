This demo creates a **single Droplet** to illustrate a basic Terraform configuration.
### Initialise the configuration
* export your Digital Ocean Token: `export DIGITALOCEAN_TOKEN=<your_token>`
* initialise Terraform: `terraform init`
### Create the infrastructure
* prepare the execution plan: `terraform plan`
* create the resources: `terraform apply`
* notice the Terraform state file `terrafom.tfstate` and the `.terrafom` folder
* once the resources have been created, grab the Droplet IP and check you can login: `ssh -i ~/.ssh/id_rsa_do root@<droplet_ip>`
### Modify the infrastructure
* modify the configuration files (`terrafom.tf` and `terrafom.tfvars`) e.g. change the name of the droplet or its size. 
* run a `plan` to check the changes that would occur and run an `apply` when you're happy with these changes
* repeat
### Destroy the infrastructure
* delete all resources created by Terraform with `terrafom destroy`
