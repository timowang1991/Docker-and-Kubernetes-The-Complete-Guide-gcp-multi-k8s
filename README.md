# How to run

## travis login
* run on mac
```bash
docker run -it -v $(pwd):/app ruby:2.4 sh
gem install travis
travis login --github-token YOUR_PERSONAL_TOKEN --com
travis encrypt-file service-account.json -r timowang1991/Docker-and-Kubernetes-The-Complete-Guide-gcp-multi-k8s --com
```

## setup on gcloud CLI
```bash
gcloud config set project multi-k8s-340410
gcloud config set compute/zone asia-east1-a
gcloud container clusters get-credentials multi-cluster
kubectl create secret generic pgpassword --from-literal PGPASSWORD=mypgpassword123
```

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install my-release ingress-nginx/ingress-nginx
```
