#!/bin/sh

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y postfix
wget  https://go.dev/dl/go1.20.2.linux-amd64.tar.gz
tar -xvf go1.20.2.linux-amd64.tar.gz
/home/vagrant/go/bin/go install github.com/mailhog/MailHog@latest
sudo cp /var/www/provisioning/setup/mailhog.service /etc/systemd/system/mailhog.service
sudo systemctl enable mailhog
sudo sed -i 's/relayhost = $/relayhost = [localhost]:1025/g' /etc/postfix/main.cf

echo "                                                                                                        
================================================================================
                                                                                
You may need to reload vagrant before MailHog becomes available. 

Web interface for Mail Hog in available on port 8025

================================================================================
"