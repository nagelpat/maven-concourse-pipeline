.PHONY: init all plan apply destroy s3

# To use this script with s3 remote state, invoke first `make s3` followed by other targets, or inline like this  `make s3 plan` or `make s3 plan`

all: init plan apply

version:
	terraform --version
	terraform --help

init:
	@echo "initialize Terraform"
	terraform init

plan:
	@echo "running Terraform plan"
	terraform get -update
	terraform plan -module-depth=-1 -out terraform.tfplan

apply:
	@echo "running Terraform apply"
	terraform apply

destroy:
	@echo "running Terraform destroy"
	terraform plan -destroy -out terraform.tfplan
	terraform apply terraform.tfplan
