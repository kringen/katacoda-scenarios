## Updating and Deleting Pods

1. Delete the "web" pod immediately with no delay.

<details>
<summary>solution</summary>
<p>

```console
kubectl delete pod web --grace-period=0 --force
```
</p>
</details>

Get the IP address of the pod you just created
kubectl get pod nginx -o wide