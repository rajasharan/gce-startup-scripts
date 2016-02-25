## GKE (Google Container Engine)

#### Pushing docker images to gke private registry
```bash
# cd into the root of Dockerfile
$ cd ...
$ docker build -t <app-image> .
$ docker tag app-image us.gcr.io/<project-name>/<app-image>
$ gcloud docker push us.gcr.io/<project-name>/<app-image>
```

#### Configure kubectl with gcloud
```bash
$ gcloud components install kubectl
$ gcloud container clusters list
$ gcloud config set container/cluser <cluster-name>
$ gcloud container clusters get-credentials <cluster-name>
Fetching cluster endpoint and auth data.
kubeconfig entry generated for <cluster-name>.
```

#### Create/run application pods
```bash
$ kubectl run <pod-name> --image=us.gcr.io/<project-name>/<app-image> --replicas=3 --port=8080
$ kubectl get po -o wide
$ kubectl expose rc app --port=80 --target-port=8080 --type=LoadBalancer
$ kubectl get svc
```

#### Easy aliases
```bash
alias no="kubectl get no -o wide"
alias rc="kubectl get rc -o wide"
alias po="kubectl get po -o wide"
alias sv="kubectl get svc -o wide"
```

#### Links
  * [google-container-registry](https://cloud.google.com/container-registry/docs/)
  * [google-cluster-operations](https://cloud.google.com/container-engine/docs/clusters/operations)
  * [kubernetes-quick-start](http://kubernetes.io/v1.1/docs/user-guide/quick-start.html)

