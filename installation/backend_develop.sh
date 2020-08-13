#!/bin/sh
set -e

echo -e "\e[1;33m installing backend develop \e[0m"
work_path=$(dirname $(readlink -f $0))
base_path=$(dirname $(readlink -f ${work_path}))
config_base_path="${base_path}/config"

local_package_path="${HOME}/Downloads"
last_path=$(pwd)

# install jdk begin
echo -e "\e[1;33m     installing jdk \e[0m"

if [ ! -f /usr/bin/java ]; then
  jdk_major=8
  jdk_install_path="/usr/local"
  echo "jdk_install_path:${jdk_install_path}"
  jdk_file_path=$(find ${local_package_path} -type f -name "jdk-${jdk_major}*.tar.gz")
  echo "jdk_file_path:${jdk_file_path}"
  sudo cp -f ${jdk_file_path} ${jdk_install_path}
  jdk_file_path=$(find ${jdk_install_path} -type f -name "jdk-${jdk_major}*.tar.gz")
  sudo tar -zxf ${jdk_file_path}

  install_file_path=$(find ${jdk_install_path} -type d -name "jdk1.${jdk_major}*")
  echo "install_file_path:${install_file_path}"
  sudo chmod -R 755 ${install_file_path}

  sudo sh -c "echo '#!/bin/bash' > /etc/profile.d/jdk.sh"
  sudo sh -c "echo 'export JAVA_HOME=${install_file_path}' >> /etc/profile.d/jdk.sh"
  sudo sh -c "echo 'export PATH=\$PATH:\${JAVA_HOME}/bin' >> /etc/profile.d/jdk.sh"

  sudo chmod 755 /etc/profile.d/jdk.sh
fi

echo -e "\e[1;33m     installed jdk \e[0m"
# install jdk end

# install maven begin
echo -e "\e[1;33m     installing maven \e[0m"
# 当pom.xml中的基本属性使用了变量后，3.6.x会抛npe，所以不使用这个版本
# yay -S --noconfirm --needed maven

if [ ! -f /etc/profile.d/maven.sh ]; then
  maven_install_path="/usr/local"
  echo "maven_install_path:${maven_install_path}"
  maven_file_path=$(find ${local_package_path} -type f -name "apache-maven-*.zip")
  echo "maven_file_path:${maven_file_path}"
  sudo unzip ${maven_file_path} -d ${maven_install_path}
  install_file_path=$(find ${maven_install_path} -type d -name "apache-maven-*")
  sudo chmod -R 755 ${install_file_path}
  echo "install_file_path:${install_file_path}"

  sudo sh -c "echo '#!/bin/bash' > /etc/profile.d/maven.sh"
  sudo sh -c "echo 'export MAVEN_OPTS=-Xmx1g' >> /etc/profile.d/maven.sh"
  sudo sh -c "echo 'export M2_HOME=${install_file_path}' >> /etc/profile.d/maven.sh"
  sudo sh -c "echo 'export PATH=\$PATH:\$M2_HOME/bin' >> /etc/profile.d/maven.sh"

  sudo chmod 755 /etc/profile.d/maven.sh
fi

echo -e "\e[1;33m     installed maven \e[0m"
# install maven end

# install tomcate begin
echo -e "\e[1;33m     installing tomcat8 \e[0m"
  tomcat_major=8
  tomcat_install_path="/usr/local"
  echo "tomcat_install_path:${tomcat_install_path}"
  tomcat_file_path=$(find ${local_package_path} -type f -name "apache-tomcat-${tomcat_major}*.zip")
  echo "tomcat_file_path:${tomcat_file_path}"
  sudo rm -rf ${tomcat_install_path}/apache-tomcat-${tomcat_major}*
  sudo unzip -q ${tomcat_file_path} -d ${tomcat_install_path}
  install_file_path=$(find ${tomcat_install_path} -type d -name "apache-tomcat-${tomcat_major}*")
  echo "install_file_path:${install_file_path}"
  sudo chmod -R 755 ${install_file_path}
  sudo chmod 777 -R ${install_file_path}/webapps/manager
  sudo chmod 777 -R ${install_file_path}/temp
echo -e "\e[1;33m     installed tomcat8 \e[0m"
# install tomcate end

# install idea begin
echo -e "\e[1;33m     installing idea \e[0m"
if [ ! -f /usr/bin/idea ]; then
  yay -S --noconfirm --needed intellij-idea-ultimate-edition
  sudo ln -s -f /usr/bin/intellij-idea-ultimate-edition /usr/bin/idea
fi
echo -e "\e[1;33m     installed idea \e[0m"
# install idea end

echo -e "\e[1;33m     installing database tool \e[0m"
yay -S --noconfirm --needed mysql-workbench
if [ ! -f /usr/bin/mongodb-compass ]; then
  export ALL_PROXY=socks5://127.0.0.1:1080
  yay -S --noconfirm --needed mongodb-compass
  unset ALL_PROXY
fi

# redis-desktop-manager download source code too slow
# yay -S --noconfirm --needed redis-desktop-manager

echo -e "\e[1;33m     installed database tool \e[0m"

echo -e "\e[1;33m     installing docker \e[0m"
yay -S --noconfirm --needed docker
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json << EOF
{
  "registry-mirrors": ["https://registry.docker-cn.com"]
}
EOF
echo -e "\e[1;33m     installed docker \e[0m"

echo -e "\e[1;33m     installing virtualbox \e[0m"
yay -S --noconfirm --needed virtualbox dkms linux-headers linux54-virtualbox-host-modules
sudo modprobe vboxdrv
echo -e "\e[1;33m     installing virtualbox \e[0m"

echo -e "\e[1;33m     installing other tool \e[0m"
if [ ! -f /usr/bin/postman ]; then
  yay -S --noconfirm --needed postman-bin
fi
yay -S --noconfirm --needed astah-professional
echo -e "\e[1;33m     installed other tool \e[0m"

# 平时压测时，本地的端口不够使用，所以修改这个配置
# 调低端口释放后的等待时间，默认为60s,修改为15~30s
sudo sh -c "echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout"
# 释放TIME_WAIT端口给新连接使用
sudo sh -c "echo 1 > /proc/sys/net/ipv4/tcp_tw_reuse"

echo -e "\e[1;33m installed backend develop \e[0m"
