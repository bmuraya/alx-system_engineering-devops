# 0x08. Networking basics #1
``DevOps`` ``Network`` ``SysAdmin``

### Requirements
* All Bash script files are interpretable on Ubuntu 20.04 LTS
* All Bash script files are executable
* All Bash script was subjected shellcheck without any error
* The first line of all Bash script is exactly #!/usr/bin/env bash
* The second line of all Bash script is a comment explaining what the script is doing.


***
### Resources
* [What is 0.0.0.0](https://en.wikipedia.org/wiki/0.0.0.0)
* [What it the hosts file](https://www.makeuseof.com/tag/modify-manage-hosts-file-linux/)
* [Netcat examples](https://www.thegeekstuff.com/2012/04/nc-command-examples/)
* [Read this](http://blog.jonathanargentiero.com/docker-sed-cannot-rename-etcsedl8ysxl-device-or-resource-busy/)


***
## Tasks
|Files |Descriptions |
|:-----|:------------|
[0-change_your_home_IP](./0-change_your_home_IP) | configures Ubuntu server such that localhost resolves to 127.0.0.2 and facebook.com to 8.8.8.8
[1-show_attached_IPs](./1-show_attached_IPs) | diplays all active IPv4 IPs on the machine it's executed on
[100-port_listening_on_localhost](./100-port_listening_on_localhost) | Bash script listens on ports 98 on localhost