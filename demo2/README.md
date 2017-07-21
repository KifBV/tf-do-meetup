This demo illustrates Terraform modules, variable interpolations, and managing multiple environments.
### How to run the demo
* change directory to the development environment: `cd environment/dev`
* export your Digital Ocean Token: `export DO_TOKEN=<your_token>`
* plan the Terraform configuration: `terraform plan -var "do_token=$DO_TOKEN"`
* create the resources: `terraform apply -var "do_token=$DO_TOKEN"`
* once the resources have been created, cURL the load-balancer IP and check that you get replies from all Droplets: `for i in {1..10}; do curl <load_balancer_ip>; done`
