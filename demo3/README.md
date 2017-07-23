This demo creates a **Digital Ocean domain** to illustrate team collaboration and CI/CD workflow with Terraform.

You'll need a fork of this repo so you can push to it.
### Update the `terraform.tf` file
Change the `bucket` and `region` values according to your own AWS account.
### Configure Circle CI
* Register the repo with Circle CI
* Run the first build (it will fail but we can't setup environment variables if we don't complete this step)
* Setup the following environment variables in Circle CI:
  * `DIGITALOCEAN_TOKEN=<your_do_token>`
  * `AWS_ACCESS_KEY_ID=<your_aws_access_key_id>`
  * `AWS_SECRET_ACCESS_KEY=<your_aws_secret_access_key>`
### Create the infrastructure
Start by pushing an empty commit with: `git commit --allow-empty && git push`.

Then, modify the Terraform configuration, commit and push to deploy your changes.
### Destroy the infrastructure
The easiest way to do it here is to comment out the resources, commit and push.
