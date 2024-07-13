# Kubernetes Deployment

Here are two files one is for deployment.yml file and another one is sevice.yml file. When any changes are made in the source code then the GitHub action workflow is triggered automatically and executes all the steps defined in the ci-cd.yml file. In the ci-cd.yml file, there is a step called build_and_push which builds a new image and pushes that image in the DockerHub repository with the latest tag. I used my DockerHub account here. 

As K3s cluster in a private subnet so need to install kubectl in the bastion host and configure the secret variables in the repository. The secret variables are KUBE_CONFIG, BASTION_SSH_KEY, BASTION_HOST. The bastion host key is ec2_key key pair that was created during EC2 creation. 

the deploy step executes the kubectl apply command to deploy the application. 
