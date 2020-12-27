## Create a ReplicaSet
1. Create a replicaset with the following details:
   - nginx image
   - 4 replicas
   - Labels: 
     - app: welcome
     - tier: frontend

<details>
<summary>solution</summary>
<p>

```
cat > web-frontend-rs.yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: frontend
  labels:
    app: welcome
    tier: frontend
spec:
  replicas: 4
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: nginx
        image: nginx

kubectl apply -f web-frontend-rs.yaml
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

