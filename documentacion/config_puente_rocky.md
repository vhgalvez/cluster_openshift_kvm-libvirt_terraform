Claro, aquí tienes los pasos detallados para crear un puente de red en Rocky Linux 9:

Instalación de Herramientas Necesarias:
Primero, instala las herramientas necesarias para gestionar puentes e interfaces de red. En Rocky Linux, puedes hacer esto utilizando el gestor de paquetes dnf. Ejecuta el siguiente comando en la terminal:

bash
Copiar código
sudo dnf install bridge-utils net-tools
Configuración del Puente de Red:
Crea un archivo de configuración para el puente de red en /etc/sysconfig/network-scripts/. Puedes nombrar este archivo ifcfg-br0. Utiliza un editor de texto como vim o nano para crear y editar el archivo:

bash
Copiar código
sudo vim /etc/sysconfig/network-scripts/ifcfg-br0
Configuración del Archivo ifcfg-br0:
Dentro del archivo ifcfg-br0, añade el siguiente contenido:

bash
Copiar código
DEVICE=br0
TYPE=Bridge
BOOTPROTO=static
IPADDR=TU_IP_ESTÁTICA
PREFIX=TU_PREFIJO_DE_RED
GATEWAY=TU_PUERTA_DE_ENLACE
DNS1=TU_DNS_PRIMARIO
DNS2=TU_DNS_SECUNDARIO
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=no
ONBOOT=yes
NM_CONTROLLED=no
DELAY=0
Configuración de la Interfaz Física:
Ahora, necesitas configurar la interfaz física que se utilizará como parte del puente. Para ello, crea o edita el archivo correspondiente en el mismo directorio (/etc/sysconfig/network-scripts/). Por ejemplo, si tu interfaz física es enp3s0f0, el archivo sería ifcfg-enp3s0f0. Edita este archivo y asegúrate de que tenga una línea que haga referencia al puente br0. Debería verse algo así:

bash
Copiar código
DEVICE=enp3s0f0
TYPE=Ethernet
BOOTPROTO=none
ONBOOT=yes
BRIDGE=br0
Reinicio de los Servicios de Red:
Para aplicar los cambios, reinicia los servicios de red. Puedes hacerlo ejecutando el siguiente comando:

bash
Copiar código
sudo systemctl restart NetworkManager
Verificación de la Configuración del Puente:
Verifica que el puente esté correctamente configurado y operativo ejecutando el siguiente comando:

bash
Copiar código
ip addr show br0
Con estos pasos, habrás creado un puente de red en Rocky Linux 9. Asegúrate de ajustar los valores específicos, como la dirección IP estática, la puerta de enlace y los servidores DNS, según tu propia configuración de red.



sudo ovs-vsctl del-br br0



Parece que el puente de red br0 se ha creado correctamente, así como la configuración del esclavo del puente con la interfaz enp3s0f0. Sin embargo, parece que br0 está siendo tratado como un dispositivo no gestionado por NetworkManager.

Podemos intentar resolver esto marcando el puente como gestionado por NetworkManager. Puedes hacerlo modificando el archivo de configuración correspondiente en /etc/NetworkManager/conf.d/. Aquí hay algunos pasos que puedes seguir:

Editar el archivo de configuración de NetworkManager:
bash
Copiar código
sudo nano /etc/NetworkManager/conf.d/10-globally-managed-devices.conf
Agrega la línea para incluir br0 como dispositivo gestionado:
csharp
Copiar código
[keyfile]
unmanaged-devices=none
Guarda y cierra el archivo.
Una vez que hayas realizado estos cambios, reinicia NetworkManager:

bash
Copiar código
sudo systemctl restart NetworkManager
Después de reiniciar NetworkManager, intenta nuevamente activar la conexión br0:

bash
Copiar código
sudo nmcli connection up br0
Con suerte, esto debería permitir que NetworkManager gestione el puente de red br0 correctamente. Si sigues experimentando problemas, avísame para que pueda ayudarte más.


Detener y desactivar Open vSwitch:
bash
Copiar código
sudo systemctl stop openvswitch
sudo systemctl disable openvswitch
Deshabilitar el inicio automático de Open vSwitch:
bash
Copiar código
sudo systemctl mask openvswitch
Reiniciar NetworkManager:
bash
Copiar código
sudo systemctl restart NetworkManager

Para solucionar este problema, necesitas configurar NetworkManager para que gestione la interfaz br0. Puedes hacerlo creando un archivo de configuración específico para br0 en /etc/NetworkManager/conf.d/. Aquí hay una forma de hacerlo:

Abre un editor de texto y crea un nuevo archivo de configuración para br0 en /etc/NetworkManager/conf.d/. Puedes nombrarlo como quieras, por ejemplo, br0.conf.

En este nuevo archivo de configuración, agrega la siguiente configuración:

csharp
Copiar código
[device]
match-device=br0
Esto le indica a NetworkManager que debe gestionar la interfaz br0.

Guarda el archivo y ciérralo.

Reinicia NetworkManager para que aplique los cambios:

Copiar código
sudo systemctl restart NetworkManager