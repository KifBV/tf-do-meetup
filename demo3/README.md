Register the repo with Circle CI

Setup the following environment variables in Circle CI:
* TF_VAR_do_token=<your_do_token>
* TF_VAR_ACCESS_KEY=<your_aws_access_key_id>
* TF_VAR_SECRET_KEY=<your_aws_secret_access_key>

Modify the Terraform configuration and `git push` to deploy your changes.
