## ConfigMaps
1. Create a configmap named *settings* with the following values:
   - timeout=400
   - lag=700

2. Create a configmap from a text file by the name of settings2 and the following values:
   - animal=lion
   - sound=roar

3. Create another configmap from the same file named settings3 using a key "game-config"

<details>
<summary>solution</summary>
<p>

```
kubectl create configmap settings --from-literal=timeout=400 --from-literall=lag=700

echo -e "animal=lion\nsound=roar" > config.txt
kubectl create configmap settings2 --from-file=config.txt

kubectl create configmap settings3 --from-file=game-config=config.txt

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

