#!/usr/bin/env bash


curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo

#curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo
#dnf module disable mysql

yum install mysql-community-server -y

systemctl enable mysqld
systemctl start mysqld

#sudo grep 'A temporary password' /var/log/mysqld.log | awk '{print $NF}'
#export MYSQL_PASSWORD=RoboShop@1
DEFAULT_PASSWORD=$(sudo grep 'A temporary password' /var/log/mysqld.log | awk '{print $NF}');

echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_PASSWORD';" | mysql --connect-expired-password -uroot -p${DEFAULT_PASSWORD}

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