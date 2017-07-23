This demo creates a **load balancer** to illustrate Terraform modules, variable interpolations, and managing multiple environments.
### Initialise the configuration
* change directory to the development environment: `cd environment/dev`
* export your Digital Ocean Token: `export DIGITALOCEAN_TOKEN=<your_token>`
* initialise Terraform and retrieve the modules: `terraform init && terraform get`
### Create the infrastructure
* plan the Terraform configuration: `terraform plan`
* create the resources: `terraform apply`
* once the resources have been created, cURL the load-balancer IP and check that you get replies from all Droplets: `for i in {1..15}; do curl <load_balancer_ip>; done`
### Modify the infrastructure
* modify the configuration files
* run a `plan` to check the changes that would occur and run an `apply` when you're happy with these changes
* repeat
### Destroy the infrastructure
* delete all resources created by Terraform with `terrafom destroy`
