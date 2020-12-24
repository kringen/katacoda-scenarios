## Updating and Deleting Pods

1. Change the image version of the web pod to use the 1.15-alpine tag.
2. Check the image version of the web pod using jsonpath syntax.
3. Get the IP address of the web pod.

<details>
<summary>solution</summary>
<p>

```console
# change the image of the pod you just created to use 1.15-alpine tag.
kubectl set image pod/nginx nginx=nginx:1.15-alpine
kubectl describe pod nginx
kubectl set image --help for more examples

# check the image version of a pod using jsonpath.
kubectl get po nginx -o jsonpath='{.spec.containers[].image}{"\n"}'

Get the IP address of the web pod.
kubectl get pod nginx -o wide
```
</p>
</details>



