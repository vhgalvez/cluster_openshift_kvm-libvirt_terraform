



## maquina virtual

/etc/sysconfig/network-scripts/ifcfg-eth0

REVWSUNFPWV0aDAKVFlQRT1FdGhlcm5ldApPTkJPT1Q9eWVzCkJPT1RQUk9UTz1ub25lCkJSSURHRT1icjA=

DEVICE=eth0
TYPE=Ethernet
ONBOOT=yes
BOOTPROTO=none
BRIDGE=br0



/etc/sysconfig/network-scripts/ifcfg-br0

REVWSUNFPWJyMApUWVBFPUJyaWRnZQpPTkJPT1Q9eWVzCkJPT1RQUk9UTz1zdGF0aWMKSVBBRERSPTE5Mi4xNjguMC4zNQpQUkVGSVg9MjQKR0FURVdBWT0xOTIuMTY4LjAuMQpETlMxPTguOC44LjgKRE5TMj04LjguNC40CkRFRlJPVVRFPXllcwpJUFY0X0ZBSUxVUkVfRkFUQUw9bm8KSVBWNklOSVQ9bm8=

DEVICE=br0
TYPE=Bridge
ONBOOT=yes
BOOTPROTO=static
IPADDR=192.168.0.35
PREFIX=24
GATEWAY=192.168.0.1
DNS1=8.8.8.8
DNS2=8.8.4.4
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=no