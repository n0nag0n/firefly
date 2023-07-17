#!/bin/sh

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list

sudo apt-get update && sudo apt-get install -y elasticsearch


sudo systemctl enable elasticsearch
sudo systemctl start elasticsearch

sudo cp /etc/elasticsearch/certs/http_ca.crt /var/www/http_ca.crt
                                                                                                              
 echo "                                                                                                        
================================================================================
                                                                                
Please read the security information above                                     
                                                                              
Save the super user password provided above                                  
A copy of the generated http_ca.crt has been copied into /var/www                                                          
                                                                              
To test ElasticSearch is running:                                             
                                                                               
1) SSH into the vagrant box                                                  
2) curl --cacert /var/www/http_ca.crt --user elastic 'https://localhost:9200' 
                                                                                                                                                                                                         
 ===============================================================================                                                                                                              
"