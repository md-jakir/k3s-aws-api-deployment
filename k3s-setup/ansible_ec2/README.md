# K3s Cluster Deployment
To provision three EC2 nodes playbook.yml file is used. Here Ansible build-in AWS module is used to provision the EC2s in AWS infrastructure. As a reference variable, terraform_outputs.json file is used. 

Generate a key for EC2 login using the following command. This private key will be used as a login key from the bastion host. Ansible playbook will create a key pair named ec2_key. 

      $ ssh-keygen -t rsa -b 4096 -f ~/.ssh/aws_ec2_key

As the EC2 instances are created in a private subnet so from outside can't SSH login into these machines. Here I used ansible vault to secure the AWS credential. I generated a file called credential.yml file under group_vars/all directory. 

      $ openssl rand -base64 2048 > vault.pass
      $ nsible-vault create group_vars/all/credential.yml --vault-password-file vault.pass

Here, vault.pass file is used to encrypt the credential.yml file and this vault.pass file is passed when executing the ansible-playbook command looks like this.

      $ ansible-playbook playbook.yml --vault-password-file vault.pass

To install k3s packages in the master node I write down the 'install_k3s_master.yml' Ansible playbook file. To access the EC2 master node I used a bastion host. I configured the bastion host as a proxy SSH node. First I ensure that I can able to login into Bastion host from my local machine where the Ansible playbook is placed. In ~/.ssh/config file I added the following lines. 

      Host bastion
      HostName 13.126.182.183
      User ubuntu
      IdentityFile ~/.ssh/aws_ec2_key
      ForwardAgent yes

To use the SSH agent need to install the SSH agent on the local machine. I generated a public key from the bastion host in the Ubuntu user home directory's .ssh folder and then I added the id_ras.pub key as an authorized key in all EC2 instances placed in the private subnet. 

To install the K3s package in the master node I run the 'install_k3s_master.yml' playbook from the Ansible host. The master node token is needed to add agents to the cluster. 

      $ ansible-playbook -i inventory.ini install_k3s_master.yml
      $ ansible-playbook -i inventory.ini install_k3s_agents.yml

To add agent nodes to the master node I needed to add the agent node's public key as an authorized key in the master node so that the agent can SSH into master without any interruption. Without a CA hash for the CA certificate in the master node, the agent node isn't added to the cluster. 
