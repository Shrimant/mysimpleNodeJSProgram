# mysimpleNodeJSProgram

This is a small application that brings up a react service (https://github.com/Shrimant/mysimpleNodeJSProgram/blob/main/app.js) up and running.

Whenever there is a change in this repo, the associated webhooks, triggers this jobsuite: http://20.193.144.5:8080/job/CreateNPushockerImagetoACR/
The parent job: CreateNPushockerImagetoACR, pulls the repo (main branch), builds up a docker image using this docker file: https://github.com/Shrimant/mysimpleNodeJSProgram/blob/main/Dockerfile and then pushes it to the repo: https://portal.azure.com/#view/Microsoft_Azure_ContainerRegistries/RepositoryBlade/id/%2Fsubscriptions%2F5fb39dac-f894-426a-8f1e-55d74f77ed53%2FresourceGroups%2Frg-mycicdpipleline%2Fproviders%2FMicrosoft.ContainerRegistry%2Fregistries%2Fmysimpleapprepo/repository/nodejsapp . The image is tagged in the form of <Product Version>.<Month><Day>.<Num of Build that day> format. This is also used to create a formatted tag in this parent jenkins job.
  
The child job: deployAppinAKSCluster applies the latest manifest (https://github.com/Shrimant/mysimpleNodeJSProgram/blob/main/nodeappsDeploymentManifest/deployment-nodejsapp.yaml) to the AKS Cluster (https://portal.azure.com/#@chakshrigmail.onmicrosoft.com/resource/subscriptions/5fb39dac-f894-426a-8f1e-55d74f77ed53/resourceGroups/rg-mycicdpipleline/providers/Microsoft.ContainerService/managedClusters/mysamplek8scluster/overview) with the latest docker image.
