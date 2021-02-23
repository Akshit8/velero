# velero
Backing-up, restoring and migrating kubernetes cluster with velero📦

## starting a docker conatiner with terraform installed
```bash
docker run -it --rm -v ${PWD}/storage:/storage -w /storage akshit8/terraform 

chmod +x .terraform/providers/registry.terraform.io/hashicorp/google/3.54.0/linux_amd64/terraform-provider-google_v3.54.0_x5
```
