## Labels
1. Get all of the labels for pods in the **kube-system** namespace.
2. Get all pods in the **kube-system** namespace that have the label **tier**.
3. Get all pods in the **kube-system** namespace where tier = control-plane.
4. Get all pods in the **kube-system** namespace where tier is either **control-plane** or **node**.
5. Create a pod with a label:
   1. phase=poc
   2. env=dev
6. Change the label on the pod you just created:
   1. phase=testing
   2. env=qa
7. Remove the env label from the bod you just updated.
8. Label node01 with the following label:
   1. diskType=ssd
9. Create a pod that runs on a node with diskType=ssd.

<details>
<summary>solution</summary>
<p>

```
kubectl get pods -n kube-system --show-labels

kubectl get pods -n kube-system -L tier --show-labels

kubectl get pods -n kube-system -l tier=control-plane --show-labels

kubectl get pods -n kube-system -l 'tier in (control-plane,node)' --show-labels

kubectl run nginx-with-labels --image=nginx --restart=Never --labels=phase=poc,env=dev

kubectl label pod/nginx-with-labels phase=testing --overwrite
kubectl label pod/nginx-with-labels env=qa --overwrite

kubectl label pod nginx-with-labels env-

kubectl label nodes node01 disktype=ssd

kubectl run node-assignment --image=nginx --restart=Never --dry-run=client -o yaml > test.yaml

Update test.yaml definition to include the following:

nodeSelector:
   diskType: ssd

```
</p>
</details>

---
## Edit ReplicaSet
1. Edit the frontend replicaSet to use the nginx:alpine-1.15 image

<details>
<summary>solution</summary>
<p>

```
kubectl edit rs frontend

# Change image
# Delete Pods

```
</p>
</details>

