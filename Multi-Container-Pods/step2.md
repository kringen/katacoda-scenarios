## Create a Pod from YAML

1. Generate a YAML definition file with the following:
- pod should be named "nginx-from-yaml"
- pod should use the nginx image.
- pod should be deployed on the jakku namespace.
- pod should have a restart policy of Never.
- YAML file should be named nginx-from-yaml.yaml

2. Create the pod using the previously generated YAML file.
- pod should run on the jakku namespace.

3. Create another pod but this time using yaml.
- pod should use the busybox image.
- pod should be deployed on the jakku namespace.
- pod should have a restart policy of Never.
- Pod should run the following commands:
  - echo "Hello"
  - ls
  - sleep for 3600 seconds.
  
<details>
<summary>solution</summary>
<p>

```
kubectl run nginx-from-yaml --image=nginx --dry-run=client -n jakku --restart=Never -o yaml > nginx-from-yaml.yaml

kubectl apply -f nginx-from-yaml.yaml -n jakku

kubectl run busybox-commands --image=busybox--restart=Never --dry-run=client -o yaml -- /bin/sh -c "echo Hello; ls; sleep 3600" > another-nginx.yaml

kubectl apply -f another-nginx.yaml -f jakku

```
</p>
</details>
