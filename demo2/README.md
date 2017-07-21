This demo illustrates Terraform modules, variable interpolations, and managing multiple environments.
### How to run the demo
Change directory to the development environment:
`cd environment/dev`

Export your Digital Ocean Token:
`export DO_TOKEN=<your_token>`

Plan the Terraform configuration:
`terraform plan -var "do_token=$DO_TOKEN"`

Create the resources:
`terraform apply -var "do_token=$DO_TOKEN"`

Once the resources have been created, cURL the load-balancer IP and check that you get replies from all Droplets:
`for i in {1..10}; do curl <load_balancer_ip>; done`
