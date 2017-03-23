# Express-Docker-VPN-Server Setup in 3 Minutes

Requires Debian Jessie, or Docker to be installed


```
root@localhost:~# wget https://raw.githubusercontent.com/AndreasPrang/Express-Docker-VPN-Server/master/startVPN.sh
root@localhost:~# ./startVPN.bash 
Docker version 17.03.0-ce, build 3a232c8
User:<USERNAME>
Password:<PASSWORD>
IPSEC PSK:<KEY>

Using default tag: latest
latest: Pulling from hwdsl2/ipsec-vpn-server
Digest: sha256:482304598c27ef089bf3568b3f8f1ac67f87047d625b070ee38b72687a96f071
Status: Image is up to date for hwdsl2/ipsec-vpn-server:latest
0e92a56494b55a28eb52e7998232bd7563c455fc9aef924a94ef8e5695638944

# Server is running
```
