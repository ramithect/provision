/interface ethernet
reset-mac-address 0,1,2,3,4,5,6
set [ find default-name=ether1 ] name=994
set [ find default-name=ether4 ] name=DB
set [ find default-name=ether6 ] name=Deployment
set [ find default-name=ether5 ] name=Indexing
set [ find default-name=ether2 ] name=Internet
set [ find default-name=ether3 ] name=K8s
set [ find default-name=ether7 ] name=Monitoring
/interface vrrp
add interface=Internet name=vrrp3 vrid=3
add disabled=yes interface=Internet name=vrrp4 priority=140 vrid=4
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/port
set 0 name=serial0
set 1 name=serial1
/snmp community
set [ find default=yes ] disabled=yes
add addresses=192.168.70.24/32 name=X2DhrXUuZ6EF4jKD
/ipv6 settings
set accept-redirects=no accept-router-advertisements=no disable-ipv6=yes forward=no
/ip address
remove 0,1,2,3,4,5,6
add address=185.8.172.12/24 interface=994 network=185.8.172.0
add address=192.168.20.3/24 interface=Internet network=192.168.20.0
add address=192.168.30.3/24 interface=K8s network=192.168.30.0
add address=192.168.40.3/24 interface=DB network=192.168.40.0
add address=192.168.50.3/24 interface=Indexing network=192.168.50.0
add address=192.168.60.3/24 interface=Deployment network=192.168.60.0
add address=192.168.70.3/24 interface=Monitoring network=192.168.70.0
add address=192.168.20.4/24 interface=vrrp3 network=192.168.20.0
/ip cloud
set update-time=no
/ip dns
set servers=185.97.117.187,217.219.250.202,37.156.145.21,185.187.84.15,82.99.242.155 
/ip firewall address-list
add address=46.224.2.32/29 comment="Arvancloud IPs" list=whitelist
add address=92.114.16.80/28 comment="Arvancloud IPs" list=whitelist
add address=79.175.138.128/29 comment="Arvancloud IPs" list=whitelist
add address=185.143.232.0/22 comment="Arvancloud IPs" list=whitelist
add address=2.146.0.0/28 comment="Arvancloud IPs" list=whitelist
add address=89.187.178.96/29 comment="Arvancloud IPs" list=whitelist
add address=89.187.169.88/29 comment="Arvancloud IPs" list=whitelist
add address=195.181.173.128/29 comment="Arvancloud IPs" list=whitelist
add address=188.229.116.16/29 comment="Arvancloud IPs" list=whitelist
add address=164.138.128.28/31 comment="Arvancloud IPs" list=whitelist
add address=83.121.255.40/31 comment="Arvancloud IPs" list=whitelist
add address=83.123.255.56/31 comment="Arvancloud IPs" list=whitelist
add address=94.182.182.28/30 comment="Arvancloud IPs" list=whitelist
add address=185.17.115.176/30 comment="Arvancloud IPs" list=whitelist
add address=89.45.48.8/29 comment="Arvancloud IPs" list=whitelist
add address=5.213.255.36/31 comment="Arvancloud IPs" list=whitelist
add address=213.179.217.16/29 comment="Arvancloud IPs" list=whitelist
add address=188.122.83.176/29 comment="Arvancloud IPs" list=whitelist
add address=213.179.197.16/29 comment="Arvancloud IPs" list=whitelist
add address=188.122.68.224/29 comment="Arvancloud IPs" list=whitelist
add address=138.128.139.144/29 comment="Arvancloud IPs" list=whitelist
add address=5.200.14.8/29 comment="Arvancloud IPs" list=whitelist
add address=43.239.139.192/29 comment="Arvancloud IPs" list=whitelist
add address=138.128.141.16/29 comment="Arvancloud IPs" list=whitelist
add address=185.179.201.192/29 comment="Arvancloud IPs" list=whitelist
add address=213.179.201.192/29 comment="Arvancloud IPs" list=whitelist
add address=185.50.105.136/29 comment="Arvancloud IPs" list=whitelist
add address=109.200.214.248/29 comment="Arvancloud IPs" list=whitelist
add address=162.244.52.120/29 comment="Arvancloud IPs" list=whitelist
add address=213.179.213.16/29 comment="Arvancloud IPs" list=whitelist
add address=103.194.164.24/29 comment="Arvancloud IPs" list=whitelist
add address=188.122.78.136/29 comment="Arvancloud IPs" list=whitelist
add address=213.179.211.32/29 comment="Arvancloud IPs" list=whitelist
add address=188.122.80.240/29 comment="Arvancloud IPs" list=whitelist
add address=109.200.195.64/29 comment="Arvancloud IPs" list=whitelist
add address=109.200.199.224/29 comment="Arvancloud IPs" list=whitelist
add address=185.172.3.240/29 comment="IDPay Public IPs" list=whitelist
/ip firewall filter
add action=drop chain=input dst-port=53 in-interface=994 protocol=tcp
add action=drop chain=input dst-port=53 in-interface=994 protocol=udp
/ip firewall nat
add action=masquerade chain=srcnat out-interface=994 src-address=192.168.20.0/24
add action=dst-nat chain=dstnat dst-address=185.8.172.12 dst-port=1080 protocol=tcp to-addresses=192.168.20.101 to-ports=80
add action=dst-nat chain=dstnat dst-address=185.8.172.12 dst-port=2080 protocol=tcp to-addresses=192.168.20.102 to-ports=80
add action=dst-nat chain=dstnat dst-address=185.8.172.12 dst-port=1443 protocol=tcp to-addresses=192.168.20.101 to-ports=443
add action=dst-nat chain=dstnat dst-address=185.8.172.12 dst-port=2443 protocol=tcp to-addresses=192.168.20.102 to-ports=443
/ip route
add gateway=185.8.172.1
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www port=10221
set ssh port=2221
set api disabled=yes
set winbox disabled=yes
set api-ssl disabled=yes
/snmp
set enabled=yes trap-community=X2DhrXUuZ6EF4jKD
/system clock
set time-zone-name=Asia/Tehran
/system identity
set name=MikroTik-2
/system ntp client
set enabled=yes
/system ntp server
set enabled=yes manycast=yes multicast=yes
/system ntp client servers
add address=0.ir.pool.ntp.org
add address=1.asia.pool.ntp.org
add address=2.asia.pool.ntp.org
/tool graphing interface
add store-on-disk=no
/tool graphing queue
add store-on-disk=no
/tool graphing resource
add store-on-disk=no
