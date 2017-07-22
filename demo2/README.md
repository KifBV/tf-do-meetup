This demo illustrates Terraform modules, variable interpolations, and managing multiple environments.
### Initialise your Terraform configuration
* change directory to the development environment: `cd environment/dev`
* export your Digital Ocean Token: `export DO_TOKEN=<your_token>`
* initialise Terraform and retrieve the modules: `terraform init && terraform get`
### Create the infrastructure
* plan the Terraform configuration: `terraform plan -var "do_token=$DO_TOKEN"`
* create the resources: `terraform apply -var "do_token=$DO_TOKEN"`
* once the resources have been created, cURL the load-balancer IP and check that you get replies from all Droplets: `for i in {1..15}; do curl <load_balancer_ip>; done`
The workflow is then:
* modify the configuration files
* check the execution plan with `terraform plan`
* create the resources with `terraform apply` when you're happy with the plan
* repeat
