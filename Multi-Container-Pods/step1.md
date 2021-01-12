## Create a multi-container pod
1. Create a pod named "multi-container".
- container 1 and 2 should use the busybox image.
- pod should be deployed on the jakku namespace.
- pod should have a restart policy of Never.
- container 1 should run the following commands:
  - echo "Hello from container 1"
  - sleep for 3600 seconds.
-container 2 should run the following commands:
  - echo "Hello from container 2"
  - sleep for 3600 seconds.

2. Display the logs for each container in the pod you just deployed.

3. List the top processes running on each container in the pod you just deployed.  Output this to a file named file.log
   
<details>
<summary>solution</summary>
<p>

```
// Generate a starter yaml file for a single container pod with dry run flag. 
kubectl run busybox --image=busybox --restart=Never --dry-run=client -o yaml -- bin/sh -c "ls; sleep 3600" > multi-container.yaml

// edit multi-container.yaml:
spec:
  containers:
  - args:
    - bin/sh
    - -c
    - echo Hello from container 1; sleep 3600
    image: busybox
    name: busybox1
    resources: {}
  - args:
    - bin/sh
    - -c
    - echo Hello from container 2; sleep 3600
    image: busybox
    name: busybox2
    resources: {}

kubectl logs busybox -c busybox1
kubectl logs busybox -c busybox2

kubectl top pod busybox --containers > file.log

cat file.log

```
</p>
</details>

---
## Create a multi-container pod sharing a volumne

1. Create a multi-container pod with the following definition:
- container 1 running busybox image
- container 1 executing the following command: "while true; do echo ‘Hi I am from Main container’ >> /var/log/index.html; sleep 5; done”
- container 2 (sidecar) running nginx image
- exposes service on port 80
- Use emptyDir Volume and mount this volume on path /var/log for busybox and on path /usr/share/nginx/html for nginx container. 

<details>
<summary>solution</summary>
<p>

```
// Generate a starter yaml file for a single container pod with dry run flag. 
kubectl run busybox --image=busybox --restart=Never --dry-run=client -o yaml -- bin/sh -c "while true; do echo ‘Hi I am from Main container’ >> /var/log/index.html; sleep 5; done” > multi-container-volume.yanl

// edit yaml file to include volume, volume mounts, and nginx container.

spec:
  volumes:
  - name: var-logs
    emptyDir: {}
  containers:
  - image: busybox
    command: ["/bin/sh"]
    args: ["-c", "while true; do echo 'Hi I am from Main container' >> /var/log/index.html; sleep 5;done"]
    name: main-container
    resources: {}
    volumeMounts:
    - name: var-logs
      mountPath: /var/log
  - image: nginx
    name: sidecar-container
    resources: {}
    ports:
      - containerPort: 80
    volumeMounts:
    - name: var-logs
      mountPath: /usr/share/nginx/html
  dnsPolicy: ClusterFirst
  restartPolicy: Never
  
```
</p>
</details>
