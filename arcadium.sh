#!/bin/bash
sudo apt update & sudo apt upgrade -y
java -version 
if [ $? = 0 ]; 
then 
echo “java instalado”
else 
echo “A instalação do java se iniciará em seguida.” 
sudo apt install openjdk-17-jre -y 
fi 
mkdir arcadium
git clone "https://github.com/Arcadium-com/Foodie-Kioskie-Jar.git" "/home/ubuntu/arcadium"
cd /home/ubuntu/arcadium
java -jar foodie-kioskie.jar

