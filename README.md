# Terraform code for HelloWorld web tier

This code makes use of the custom `lb` module in the
[terraform-module-google-lb](https://github.com/invsblduck/terraform-module-google-lb)
repo to provision an external HTTPS load balancer for HelloWorld.

[Terragrunt](https://terragrunt.gruntwork.io/) is used to facilitate better
maintainability of version pinning and release-train environments by keeping the
configurations more [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).

## Requirements

In order to use this IaC, you will need `owner` access to the `id-me-helloworld`
project in GCP. See the official [Google Provider Configuration
Reference](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference)
to learn about how [User Application Default
Credentials](https://cloud.google.com/sdk/gcloud/reference/auth/application-default)
can be used to authenticate.

### TLS private key in GCP Secret Manager

The TLS certificate PEM is revision-controlled in this repo, but the RSA private
key is stored as a secret in GCP and is retrieved by the `lb` module.

## Remote Backend

Encrypted, locking state is kept in a GCS bucket with a unique file path based
on the file path of the module in this repo.

# Try it out

1. Navigate to a child module:

```
cd prod/us-west2/prod/lb/
```

2. Initialize the modules and providers:

```
terragrunt plan
```

3. Apply changes:

```
terragrunt apply
```

# TODO

- Add load balancer for `dev` environment.
- Automate with GitOps via Cloud Build using the `terraform` Service Account in GCP.
