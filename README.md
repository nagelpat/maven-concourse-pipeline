# Provision Infrastructure with Terraform

## Purpose

The goal of this step is to provision the runtime environment where the application will run/deploy.

We don't need to provision/install the actual services because they are provided by PCF thru the marketplace/service_brokers. Furthermore, we don't need to provision the runtime environment, i.e, the organization and space where we will deploy our applications and create service instances because they are also provided.

We will use Terraform to provision the service instances our application needs.

[A repository for live infrastructure](https://blog.gruntwork.io/how-to-use-terraform-as-a-team-251bc1104973#.t7c5tr6mc) - There should be a separate repository that declares the infrastructure you’re running in each environment (stage, prod, mgmt, etc). We should be able to reason about our infrastructure solely by looking at the live repository.


## Manually Build Docker image for terraform task

So far we don't have a pipeline to build terraform. Instead we build it locally in Mac OS for Linux (cross-compiler) and build a docker image that we can use it from Concourse.

1. Make sure *Go* is properly installed, including setting up a `GOPATH`.
2. You will also need to add `$GOPATH/bin` to your $PATH.
3. Clone your terraform branch into `$GOPATH/src/github.com/hashicorp/terraform`
4. `cd $GOPATH/src/github.com/hashicorp/terraform`
5. Build it using `XC_OS=linux XC_ARCH=amd64 make bin`
6. copy the binary from `src/github.com/hashicorp/terraform/pkg/linux_amd64/terraform` into a `bin` folder under `docker/terraform`
7. run `docker build -t terraform .`
8. tag your docker image `docker tag sha256:56747 marcialfrg/terraform:0.9.0-cf`
9. push to docker hub `docker push marcialfrg/terraform:0.9.0-cf`

Note: `0.9.0-cf` is the latest (unreleased) version of Terraform (0.9.0) plus cloud foundry provider (unreleased)
