This demo presents a basic Terraform configuration.
### How to run the demo
Export your Digital Ocean Token:
`export DO_TOKEN=<your_token>`

Plan the Terraform configuration:
`terraform plan -var "do_token=$DO_TOKEN"`

Create the resources:
`terraform apply -var "do_token=$DO_TOKEN"`

Once the resources have been created, grab the Droplet IP and check you can login:
`ssh root@<droplet_ip>`
