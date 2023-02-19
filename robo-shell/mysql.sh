#!/usr/bin/env bash
source /home/centos/roboshop-shell/common.sh
COMPONENT=mysql

if [ -z "$MYSQL_PASSWORD" ];then
  echo -e "\e[33m env c=variable MYSQL_PASSWORD is missing \e[0m"
  exit 1
fi

echo Setup MySQL repo
curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo &>>${LOG}
StatusCheck

echo Install MySQL
yum install mysql-community-server -y &>>${LOG}
StatusCheck

echo Start MySQL Service
systemctl enable mysqld &>>${LOG} && systemctl start mysqld &>>${LOG}
StatusCheck

echo "show databases;" | mysql -uroot -p$MYSQL_PASSWORD &>>${LOG}
if [ $? -ne 0 ]; then
 echo Chainging Default password
 DEFAULT_PASSWORD=$(grep 'A temporary password' /var/log/mysqld.log | awk '{print $NF}');
 echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_PASSWORD';" | mysql --connect-expired-password -uroot -p${DEFAULT_PASSWORD}
 StatusCheck
fi

exit

echo "uninstall plugin validate_password" | mysql -uroot -p$MYSQL_PASSWORD

#grep temp /var/log/mysqld.log

#mysql_secure_installation

#mysql -uroot -pRoboShop@1

#> uninstall plugin validate_password;

curl -s -L -o /tmp/mysql.zip "https://github.com/roboshop-devops-project/mysql/archive/main.zip"

cd /tmp
unzip -o mysql.zip
cd mysql-main
mysql -u root -pRoboShop@1 <shipping.sql