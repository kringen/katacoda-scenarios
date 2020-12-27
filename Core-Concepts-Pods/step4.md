## Updating and Deleting Pods

1. Delete the "web" pod immediately with no delay.

<details>
<summary>solution</summary>
<p>

```
kubectl delete pod web --grace-period=0 --force
```
</p>
</details>