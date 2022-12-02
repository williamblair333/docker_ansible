# Ansible Server in a Docker Debian Container

--guide here https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

# Setup 
Read over the docker_ansible_install.sh file and make changes accordingly.  Using pip3 instead of Debian packages.  Running that file will create the Dockerfile, its image and a docker-compose.yaml file.  Don't forget to chmod +x docker_simplehelp_install.sh. The provided Dockerfile and docker-compose.yaml are examples.

# Notes 
For wget (and maybe curl) to work, ca-certificates package needs to be installed.  You may also need to destroy any external network you're using (along with containers that use it) and recreate the network setting the mtu to 1400~ish.  Here's an example  
    docker network create \\  
        --driver=bridge \\  
        --subnet=172.16.0.0/26 \\  
        --ip-range=172.16.0.0/27 \\  
        --gateway=172.16.0.1 \\  
        -o com.docker.network.driver.mtu=1400 \\  
        <network_name>  
  
# Image
Get the latest image at https://hub.docker.com/repository/registry-1.docker.io/williamblair333/ansible/general

# Ansible .cfg Search Order
From https://www.redhat.com/sysadmin/configuring-ansible
Ansible searches for configuration files in the following order, processing the first file it finds and ignoring the rest:

    $ANSIBLE_CONFIG if the environment variable is set.
    ansible.cfg if it’s in the current directory.
    ~/.ansible.cfg if it’s in the user’s home directory.
    /etc/ansible/ansible.cfg, the default config file.
