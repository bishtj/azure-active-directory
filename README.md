# azure-active-directory
This project is a sample project to create azure user groups and roles for users.

## Run steps
Navigate to project root directory and run following command

```$ az login```

```$ terraform init```

```$ terraform plan -var-file=input.tfvars```

```$ terraform apply -var-file=input.tfvars```

```$ terraform destroy -var-file=input.tfvars```
