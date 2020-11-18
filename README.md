# Homework-13
Elk Stack Project 
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram] https://github.com/daodom/Homework-13/blob/main/Network%20Security%20Diagram%20Template.pdf

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _playbook_ file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: https://github.com/daodom/Homework-13/tree/main/ansible

This document contains the following details:
- Description of the Topology - The topology contains a resource group and all equiment associated with the resource group and network within the resource group. This includes virtual machines, load balancer, and networking rules for each piece of equipment.
- Access Policies - The access policies provide how and what machines will talk to each other. For example, the access policy of the jumpbox contains the how the jump box will connect with the local host and on what port.
- ELK Configuration
  - Beats in Use - Beats are used to perform a monitor or check on equipment at a certain frequency set by the user.
  - Machines Being Monitored - Web machines are being monitored for performance and change in log files. 
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly secure, in addition to restricting external traffic to the network.
- _TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?_
The load balancer defends an organization against distributed denial-of-service (DDoS) attacks. The load balancer actively defends against DDoS by shifting attack traffic from the corporate server to a public cloud provider.The jump box allows the system to have fewer hardware resources and prevents to overuse of memory in cloud space.
The advantage of the jump box is to allow one or few means of external traffice into the virtual network. The virtual box also allows configurations to be downloaded and then pushed to all machines inthe virtual network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the network or files in the network and system performance.
- _TODO: What does Filebeat watch for? Filebeat monitors for changes in log files or locations that are specified and collects log events.
- _TODO: What does Metricbeat record?_Statics and metrics of the operating system

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.
| Name          | Function                          | IP Address    | Operating System |
|---------------|-----------------------------------|---------------|------------------|
| VMRedTeam3    | jumpbox                           | 52.170.19.234 | linux            |
| RedTeamWebVM1 | web-machine internal to container | 10.0.0.10     | linux            |
| RedTeamWebVM2 | web-machine internal to container | 10.0.0.7      | linux            |
| ElkVN2VM      | Elk-machine                       | 10.1.0.4      | linux            |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jumpbox or Elk Machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _TODO: IP address of local host - 23.24.93.36 and IP address of Elk Machine -  52.250.18.159

Machines within the network can only be accessed by jumpbox.
- _TODO: Which machine did you allow to access your ELK VM? Jump Box 
        What was its IP address?_52.170.19.234- jumpbox IP address

A summary of the access policies in place can be found in the table below.
| Name       | Publicly Accessible | Allowed IP Address               |
|------------|---------------------|----------------------------------|
| VMRedTeam3 | Yes                 | 23.24.93.36, 10.0.0.10, 10.0.0.7 |
| ElkVN2VM   | Yes                 | 10.0.0.5, 10.0.0.10, 10.0.0.7    |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because the auto configuration reduced errors and allowed configuration from one machine rather than configuring multiple machines.
- _TODO: What is the main advantage of automating configuration with Ansible?_The advantage to automating configuration with Ansbile is it allows the adminstrator to use one machine to configure multiple machines. In short, the automation raises efficiency, raises security and allows the adminstrator to focus on higher priority items.

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- Set the remote user which will access ELK server
- Update system
- Installs python3-pip
- Install docker module
- Increase memory and sets memory of container
- Donwload the container to Elk Server
- Open ports 5601, 9200 to listen for Kibana access

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](https://github.com/daodom/Homework-13/blob/main/Screen%20Shot%202020-11-16%20at%209.06.19%20PM.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: RedTeamWebVM1 - 10.0.0.10 and RedTeamWebVM2- 10.0.0.7

We have installed the following Beats on these machines:
- _TODO: WebVM1 and 2 (RedTeamWebVM1 and RedTeamWebVM2)

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._ There are different beat applications, the beats we installed were:
1. File Beats which monirots files we specified and creates a log when differences are detected.
2. Metricbeats - Monitors performance on the machines being monitored.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _filebeat.confg___ file to /etc/ansible__.
- Update the __hosts___ file to include...IP addresses of webmachines (webservers)
- Run the playbook, and navigate to _ping___ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? myplaybook.yml,filebeat-playbook.yml, metricbeat.yml  
   Where do you copy it?_/etc/ansible inside of the Ansible Docker Container
- _Which file do you update to make Ansible run the playbook on a specific machine?     hosts file
How do I specify which machine to install the ELK server on versus which to install Filebeat on?_ You specify the machine to install the information upon by updating the Filebeat config and Metric Beat config file to include the address of the elk machine. Also inside of the playbook for each (Metric and Filebeat) you place the name of the Elk machine as hte host.
- _Which URL do you navigate to in order to check that the ELK server is running?
http://52.250.18.159:5601/app/kibana#/discover?_g=(refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(columns:!(_source),index:'filebeat-*',interval:auto,query:(language:kuery,query:''),sort:!(!('@timestamp',desc)))

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

1. ssh redteamadmin@52.170.19.234
2. sudo su
3. install docker.io
2. systemctl start docker
3. docker pull cyberxsecurity/ansible
4. docker run -ti cyberxsecurity/ansible bash
5. docker images
6. sudo docker container list -a
7. sudo docker start hardcore_lovelace
8. sudo docker attach hardcore_lovelace
9. nano /etc/ansible/hosts 
  uncomment webservers and add IP addresses of web machines
  including Elk machine. Example of IP address to add 
  10.0.0.10 ansible_python_interpreter=/usr/bin/pythong
10. nano /etc/ansible/ansible.cfg file
    add remote users name for elk machines and webvms
11. ansible -m ping all or ssh into all machines
