#!/bin/bash
USER=$1
PASSWORD=$2

# crea usuario
useradd -m -s /bin/bash -p $(openssl passwd $PASSWORD) $USER
# añade usuario al grupo sudo
usermod -aG sudo $USER
# permite al usuario ejecutar comandos sudo sin contraseña
sudoers_entry="$USER ALL=(ALL:ALL) NOPASSWD:ALL"
echo $sudoers_entry | cat >> /etc/sudoers.d/$USER
# habilita la conexión SSH con contraseña
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
# reinicia el demonio SSH
systemctl restart ssh
