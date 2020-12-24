## Create Namespace
1. Create a namespace named "jakku".
<details>
<summary>solution</summary>
<p>

```console
kubectl create namespace jakku
```
</p>
</details>

---
## Create Pod
1. Create a pod named "web".
- pod should use the nginx:latest image.
- pod should be deployed on the jakku namespace.
- pod should have a restart policy of Never.
<details>
<summary>solution</summary>
<p>

```console
kubectl run web --image=nginx:latest --restart=Never -n jakku --dry-run -o yaml > ~/web-pod.yaml

```
</p>
</details>

---
## Create a Pod that runs a command

2. Create a pod named "busybox-sleep".
- pod should use the busybox image.
- pod should be deployed on the jakku namespace.
- pod should have a restart policy of Never.
- Pod should run the following commands:
  - sleep for 3600 seconds.


<details>
<summary>solution</summary>
<p>

```console
kubectl run busybox-sleep --image=busybox -n jakku --restart=Never -- /bin/sh -c "sleep 3600;"

```
</p>
</details>

## Create a Pod from YAML

2. Generate a YAML definition file with the following:
- pod should be named "nginx-from-yaml"
- pod should use the nginx image.
- pod should be deployed on the jakku namespace.
- pod should have a restart policy of Never.
- YAML file should be named nginx-from-yaml.yaml

3. Create the pod using the previously generated YAML file.
- pod should run on the jakku namespace.

<details>
<summary>solution</summary>
<p>

```console
kubectl run nginx-from-yaml --image=nginx --dry-run -n jakku --restart=Never -o yaml > nginx-from-yaml.yaml

kubectl apply -f nginx-from-yaml.yaml -n jakku
```
</p>
</details>
