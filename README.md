# Ansible Server in a Docker Debian Container

--guide here https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

# Setup 
Read over the docker_ansible_install.sh file and make changes accordingly.  Using pip3 instead of Debian packages.  Running that file will create the Dockerfile, its image and a docker-compose.yaml file.  Don't forget to chmod +x docker_simplehelp_install.sh. The provided Dockerfile and docker-compose.yaml are examples.

# Notes 
For wget (and maybe curl) to work, ca-certificates package needs to be installed.  You may also need to destroy any external network you're using (along with containers that use it) and recreate the network setting the mtu to 1400~ish.  Here's an example  
    ```docker network create \```  
    ```--driver=bridge \```  
    ```--subnet=172.16.0.0/26 \```  
    ```--ip-range=172.16.0.0/27 \```  
    ```--gateway=172.16.0.1 \```  
    ```-o com.docker.network.driver.mtu=1400 \```  
    ```<network_name>```  
  
# Image
Get the latest image at https://hub.docker.com/repository/registry-1.docker.io/williamblair333/ansible/general

# Example Usage
Create an alias in ~/.bashrc or ad-hoc to run commands as if ansible were installed:  
  
```alias ansible='docker exec -it <container_name> ./ansible"$1"'```  
```ansible --version
ansible [core 2.13.0]
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/ansible/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/ansible/.local/lib/python3.9/site-packages/ansible
  ansible collection location = /home/ansible/.ansible/collections:/usr/share/ansible/collections
  executable location = ./ansible
  python version = 3.9.2 (default, Feb 28 2021, 17:03:44) [GCC 10.2.1 20210110]
  jinja version = 3.1.2
  libyaml = True```
