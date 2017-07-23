This demo creates a **Digital Ocean domain** to illustrate team collaboration and CI/CD workflow with Terraform.
### Initialise Circle CI
* Register the repo with Circle CI
* Setup the following environment variables in Circle CI:
  * TF_VAR_do_token=<your_do_token>
  * TF_VAR_ACCESS_KEY=<your_aws_access_key_id>
  * TF_VAR_SECRET_KEY=<your_aws_secret_access_key>
### Create the infrastructure
Start by pushing an empty commit with: `git commit --allow-empty && git push`
Then, modify the Terraform configuration, commit and push to deploy your changes.
### Destroy the infrastructure
The easiest way to do it here is to comment out the resources, commit and push.
