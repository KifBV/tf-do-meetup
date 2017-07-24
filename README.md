Digital Ocean Meetup, Bucharest - 24/07/2017
## Pre-requisites
To run demos 1 & 2:
* download **Terraform v0.10.0-rc1** [here](https://releases.hashicorp.com/terraform/0.10.0-rc1/), unzip it and move the binary to `/usr/local/bin` or somewhere else in your `$PATH`).
* create and download a **Digital Ocean API Token** from the [API page](https://cloud.digitalocean.com/settings/api/tokens) of your Digital Ocean profile.
* create 2 ssh keys:
  * `ssh-keygen -C 'DO Meetup' -f ~/.ssh/id_rsa_do`
  * `ssh-keygen -C 'DO Meetup' -f ~/.ssh/id_rsa_github`

To run demo 3 you'll also need:
* the **AWS Access Key ID** and **Secret Access Key** of a user with _AdministratorAccess_ policy attached.
* an **S3** bucket in the same account as the above user.

## Slides
Clone this repository and open the `slides/index.html` file locally in your web browser to play the presentation.

## Demos
Specific instructions are in each demo folder.
* demo1: basic Terraform usage (providers, resources, variables)
* demo2: more advanced usage (multiple environments, count, modules, github sources)
* demo3: collaborative usage and CI/CD workflow (remote state, Circle CI)
