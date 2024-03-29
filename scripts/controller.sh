#!/bin/bash
USER=$1
PASSWORD=$2
WORDPRESS_IP=$3
MYSQL_IP=$4

# instala ansible y sshpass
apt update
apt install -y ansible sshpass
# corrige el archivo de ansible
sed -i.bak '430s/'\''/[`'\'']/g' /usr/lib/python3/dist-packages/ansible/modules/database/mysql/mysql_user.py
# crea usuario
useradd -m -s /bin/bash -p $(openssl passwd $PASSWORD) $USER
# añade usuario al grupo sudo
usermod -aG sudo $USER
# crea clave SSH
sudo -u $USER ssh-keygen -t rsa -f /home/$USER/.ssh/id_rsa -N ""
# envía la clave SSH a los workers
sleep 1
cat /home/$USER/.ssh/id_rsa.pub | sudo -u $USER sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no $USER@$WORDPRESS_IP "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
cat /home/$USER/.ssh/id_rsa.pub | sudo -u $USER sshpass -p $PASSWORD ssh -o StrictHostKeyChecking=no $USER@$MYSQL_IP "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
# ejecuta el playbook de ansible
cd /tmp/ansible/
sudo -u $USER ansible-playbook playbook.yml
