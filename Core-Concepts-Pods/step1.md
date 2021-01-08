## Create Namespace
1. Create a namespace named "jakku".

<details>
<summary>solution</summary>
<p>

```
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
- pos service should be exposed on port 80.

1. What command would be useful to find the IP address of the pod and on which node is the pod running?
   
<details>
<summary>solution</summary>
<p>

```
kubectl run web --image=nginx:latest --restart=Never -n jakku --dry-run=client --port 80 -o yaml > ~/web-pod.yaml

kubectl get pod web -n jakku -o wide

```
</p>
</details>

---
## Create a Pod that runs a command

1. Create a pod named "busybox-sleep".
- pod should use the busybox image.
- pod should be deployed on the jakku namespace.
- pod should have a restart policy of Never.
- Pod should run the following commands:
  - sleep for 3600 seconds.


<details>
<summary>solution</summary>
<p>

```
kubectl run busybox-sleep --image=busybox -n jakku --restart=Never -- /bin/sh -c "sleep 3600;"

```
</p>
</details>
