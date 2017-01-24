# Provision Infrastructure with Terraform

## Purpose

The goal of this step is to provision the runtime environment where the application will run/deploy.

We don't need to provision services' infrastructure (because they are provided by PCF thru the marketplace/service_brokers). That is given for granted. Instead we need to provision:
- an `organization` -if there is not one already provided-. Most likely, `organization` will be provided before hand.
- an `space` within the `organization`.
- some `quotas` for the space and/or organization.
- services such as a database one, or a messaging one, a service registry, etc.

Our application(s) will be deployed to more than one runtime environment (runtime environment =  `organization`+`space`), e.g. one for build-verification, another for UAT, and another one for production. Each environment will be almost identical to the other however there will be differences such as service's plans and/or its type, quotas.

[A repository for live infrastructure](https://blog.gruntwork.io/how-to-use-terraform-as-a-team-251bc1104973#.t7c5tr6mc) - There should be a separate repository that defines the live infrastructure you’re running in each environment (stage, prod, mgmt, etc). We should be able to reason about our infrastructure solely by looking at the live repository.
