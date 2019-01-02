# Usages


#### Start up the container and let it run in the background
This mode allowd you to create a sort of "session" that you can come back to, because the container keeps running in the background until you shut it down, you can keep re-connecting to the "session"



To begin start the container and let it run in background:

```bash
docker \
run -d \
-v $(pwd):/root \
-v $HOME:/homedir \
-v /var/run/docker.sock:/var/run/docker.sock \
--name ibmcloud-cli \
sebestyen/ibmcloud-cli:latest \
bash -c 'tail -f /dev/null'
```



Note:

* It is using the **latest** tag. If you wish to insulate yourself from breakages you can use a specific version tag such as **1.0.0** please see `tags` tab for additional available versions.
* Also Mounts the current directory into the container as the working directory
* We bind to the docker socket on the host, so that we can run docker commands within the docker container.  Note that this means it will control the docker daemon runnin on the host itself. 



Enter the container at any time to run commands like this:

```
docker exec -it ibmcloud-cli bash
```



This will put you into the work directory `/workdir` which in turn is mapped to the host's current directory from where the container was launched.




## Gain access to your cluster

##### 1. Log in to your IBM Cloud account
```
ibmcloud login -a https://api.ng.bluemix.net
```
`If you have a federated ID, use ibmcloud login --sso to log in to the IBM Cloud CLI.`

##### 2. Target the IBM Cloud Container Service region in which you want to work.

```
ibmcloud cs region-set us-south
```

##### 3. Get the command to set the environment variable and download the Kubernetes configuration files.

```
ibmcloud cs cluster-config <cluster-name>
```

##### 4. Set the KUBECONFIG environment variable. Copy the output from the previous command and paste it in your terminal. The command output should look similar to the following.

```
export KUBECONFIG=/Users/$USER/.bluemix/plugins/container-service/clusters/<cluster-name>/kube-config-dal13-<cluster-name>.yml
```

Alternatively, you may directly download your kubeconfig files to manually configure the kubernetes cluster context.

##### 5 Verify that you can connect to your cluster by listing your worker nodes.

```
kubectl get nodes
```


## How to use Kubernetes on IBM Cloud

* [Learn Kubernetes Basics](https://kubernetes.io/docs/tutorials/kubernetes-basics/)
* [IBM Cloud Kubernetes](https://www.ibm.com/cloud/container-service)
* [Deploy a scalable web application on Kubernetes](https://console.bluemix.net/docs/tutorials/scalable-webapp-kubernetes.html#deploy-a-scalable-web-application-on-kubernetes)
* [Analyze logs and monitor the health of Kubernetes applications](https://console.bluemix.net/docs/tutorials/kubernetes-log-analysis-kibana.html#analyze-logs-and-monitor-the-health-of-kubernetes-applications)
* [Continuous deployment to Kubernetes](https://console.bluemix.net/docs/tutorials/continuous-deployment-to-kubernetes.html#continuous-deployment-to-kubernetes)
* [Create clusters](https://console.bluemix.net/docs/containers/cs_tutorials.html#cs_cluster_tutorial)
