# velero
Backing-up, restoring and migrating kubernetes cluster with velero📦

## starting a docker conatiner with terraform installed
```bash
docker run -it --rm -v ${PWD}/storage:/storage -w /storage akshit8/terraform 

chmod +x .terraform/providers/registry.terraform.io/hashicorp/google/3.54.0/linux_amd64/terraform-provider-google_v3.54.0_x5
```

## setting up a test cluster with kind
```bash
kind create cluster --name test-cluster --image kindest/node:v1.17.0

docker run -it --rm -v ${HOME}:/root/ -v ${PWD}:/work -w /work --net host debian:buster

apt-get update && apt install curl vim

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

chmod +x ./kubectl

mv ./kubectl /usr/local/bin/kubectl

root@my-vm:/work# kubectl get nodes
NAME                         STATUS   ROLES    AGE     VERSION
test-cluster-control-plane   Ready    master   5m15s   v1.17.0

curl -L -o /tmp/velero.tar.gz https://github.com/vmware-tanzu/velero/releases/download/v1.5.1/velero-v1.5.1-linux-amd64.tar.gz

tar -C /tmp -xvf /tmp/velero.tar.gz

mv /tmp/velero-v1.5.1-linux-amd64/velero /usr/local/bin/velero

chmod +x /usr/local/bin/velero

velero --help

kubectl create ns sample

kubectl -n sample apply -f ./k8s-objects

export BUCKET=velero-akshit
export REGION=asia-east1

velero install \
    --provider gcp \
    --plugins velero/velero-plugin-for-gcp:v1.1.0 \
    --bucket $BUCKET \
    --secret-file ./gcpServiceAccount/credentials.json

root@my-vm:/work# kubectl -n velero get pods
NAME                      READY   STATUS    RESTARTS   AGE
velero-86bb45cdfb-987ps   1/1     Running   0          23s

kubectl logs deployment/velero -n velero

velero backup create sample-namespace-backup --include-namespaces sample

velero backup describe sample-namespace-backup

velero backup logs sample-namespace-backup
```
