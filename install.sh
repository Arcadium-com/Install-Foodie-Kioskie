#!/bin/bash
clear
echo "
█ █▄░█ █▀ ▀█▀ ▄▀█ █░░ ▄▀█ █▀▄ █▀█ █▀█   █▀▄ █▀█   █▀▀ █▀█ █▀█ █▀▄ █ █▀▀   █▄▀ █ █▀█ █▀ █▄▀ █ █▀▀
█ █░▀█ ▄█ ░█░ █▀█ █▄▄ █▀█ █▄▀ █▄█ █▀▄   █▄▀ █▄█   █▀░ █▄█ █▄█ █▄▀ █ ██▄   █░█ █ █▄█ ▄█ █░█ █ ██▄
"
sleep 3
# Verificando a versão do Java
java -version

if [ $? = 0 ];
    then
        echo ""
        echo "O Jᴀᴠᴀ ᴊᴀ́ ᴇsᴛᴀ́ ɪɴsᴛᴀʟᴀᴅᴏ.
        "
        sleep 3
    else
        sleep 3
        echo ""
        echo "
        Aᴛᴜᴀʟɪᴢᴀʀᴇᴍᴏs ᴏs ʀᴇᴘᴏsɪᴛᴏ́ʀɪᴏs ᴇ ɪɴsᴛᴀʟᴀʀᴇᴍᴏs ᴀs ᴀᴛᴜᴀʟɪᴢᴀᴄ̧ᴏ̃ᴇs ᴅᴏs ᴘᴀᴄᴏᴛᴇs.
        "
        sleep 3
        sudo apt update & sudo apt upgrade -y
        echo "Iɴɪᴄɪᴀʀᴇᴍᴏs ᴀ ɪɴsᴛᴀʟᴀᴄ̧ᴀ̃ᴏ ᴅᴏ Jᴀᴠᴀ.
        "
        sleep 3
        # Instalando o JRE para executar o JAR
        sudo apt install default-jre -y
fi

clear

########################################################################

echo "
█ █▄░█ █▀ ▀█▀ ▄▀█ █░░ ▄▀█ █▀▄ █▀█ █▀█   █▀▄ █▀█   █▀▀ █▀█ █▀█ █▀▄ █ █▀▀   █▄▀ █ █▀█ █▀ █▄▀ █ █▀▀
█ █░▀█ ▄█ ░█░ █▀█ █▄▄ █▀█ █▄▀ █▄█ █▀▄   █▄▀ █▄█   █▀░ █▄█ █▄█ █▄▀ █ ██▄   █░█ █ █▄█ ▄█ █░█ █ ██▄
"
docker --version 
sleep 5
  
if [ $? = 0 ]; 
    then 
        echo ""
        echo "O Dᴏᴄᴋᴇʀ ᴊᴀ́ ᴇsᴛᴀ́ ɪɴsᴛᴀʟᴀᴅᴏ.
        "
        sleep 3
    else 
        echo ""
        echo "Aᴛᴜᴀʟɪᴢᴀʀᴇᴍᴏs ᴏs ʀᴇᴘᴏsɪᴛᴏ́ʀɪᴏs ᴇ ɪɴsᴛᴀʟᴀʀᴇᴍᴏs ᴀs ᴀᴛᴜᴀʟɪᴢᴀᴄ̧ᴏ̃ᴇs ᴅᴏs ᴘᴀᴄᴏᴛᴇs.
        "
        sleep 3
        sudo apt update & sudo apt upgrade -y
        clear
        echo "Iɴɪᴄɪᴀʀᴇᴍᴏs ᴀ ɪɴsᴛᴀʟᴀᴄ̧ᴀ̃ᴏ ᴅᴏ Dᴏᴄᴋᴇʀ"
        sleep 3
        # Instalando o Docker  
        sudo apt install docker.io -y
fi

########################################################################

# Iniciando o serviço do Docker
sudo systemctl start docker
# Ativando o serviço do Docker sempre que ligar o computador
sudo systemctl enable docker

mkdir arcadium
cd ./arcadium
clear

########################################################################

echo "
█ █▄░█ █▀ ▀█▀ ▄▀█ █░░ ▄▀█ █▀▄ █▀█ █▀█   █▀▄ █▀█   █▀▀ █▀█ █▀█ █▀▄ █ █▀▀   █▄▀ █ █▀█ █▀ █▄▀ █ █▀▀
█ █░▀█ ▄█ ░█░ █▀█ █▄▄ █▀█ █▄▀ █▄█ █▀▄   █▄▀ █▄█   █▀░ █▄█ █▄█ █▄▀ █ ██▄   █░█ █ █▄█ ▄█ █░█ █ ██▄
"
echo "Rᴇᴀʟɪᴢᴀʀᴇᴍᴏs ᴀ ᴄᴏɴғɪɢᴜʀᴀᴄ̧ᴀ̃ᴏ ᴅᴏ Dᴏᴄᴋᴇʀ
"

# Baixando o arquivo com as configurações da imagem do MySQL
wget https://github.com/Arcadium-com/Install-Foodie-Kioskie/raw/main/Dockerfile
sleep 4
mkdir arquivos_sql
cd arquivos_sql
# Baixando o arquivo SQL com as tabelas do banco
wget https://github.com/Arcadium-com/Script-BD/raw/main/001-arcadium.sql
cd ..

########################################################################

# Contruindo a imagem com as configurações do banco
sudo docker build -t foodie-kioskie:1.0 .
# Criando um container da imagem criada e executando
sudo docker run --name bdArcadium -p 3306:3306 -d foodie-kioskie:1.0
# Removendo os arquivos com as tabelas do banco
rm ./arquivos_sql/001-arcadium.sql   
# Removendo a pasta
rmdir arquivos_sql
clear

########################################################################

echo "
█ █▄░█ █▀ ▀█▀ ▄▀█ █░░ ▄▀█ █▀▄ █▀█ █▀█   █▀▄ █▀█   █▀▀ █▀█ █▀█ █▀▄ █ █▀▀   █▄▀ █ █▀█ █▀ █▄▀ █ █▀▀
█ █░▀█ ▄█ ░█░ █▀█ █▄▄ █▀█ █▄▀ █▄█ █▀▄   █▄▀ █▄█   █▀░ █▄█ █▄█ █▄▀ █ ██▄   █░█ █ █▄█ ▄█ █░█ █ ██▄
"
echo "Iɴsᴛᴀʟᴀʀᴇᴍᴏs ᴀ ᴀᴘʟɪᴄᴀᴄ̧ᴀ̃ᴏ Fᴏᴏᴅɪᴇ Kɪᴏsᴋɪᴇ.  
"
sleep 4
wget https://github.com/Arcadium-com/Foodie-Kioskie-Jar/raw/main/foodie-kioskie.jar
clear

########################################################################

echo "
█ █▄░█ █▀ ▀█▀ ▄▀█ █░░ ▄▀█ █▀▄ █▀█ █▀█   █▀▄ █▀█   █▀▀ █▀█ █▀█ █▀▄ █ █▀▀   █▄▀ █ █▀█ █▀ █▄▀ █ █▀▀
█ █░▀█ ▄█ ░█░ █▀█ █▄▄ █▀█ █▄▀ █▄█ █▀▄   █▄▀ █▄█   █▀░ █▄█ █▄█ █▄▀ █ ██▄   █░█ █ █▄█ ▄█ █░█ █ ██▄
"
echo "Iɴɪᴄɪᴀʀᴇᴍᴏs ᴀ ᴀᴘʟɪᴄᴀᴄ̧ᴀ̃ᴏ Fᴏᴏᴅɪᴇ Kɪᴏsᴋɪᴇ.
"
sleep 4
clear

########################################################################
# Confirmando a execução do container
sudo docker start bdArcadium
# rm ../install.sh
java -jar foodie-kioskie.jar