#!/usr/bin/env bash

curl -L https://raw.githubusercontent.com/roboshop-devops-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo
yum install redis-6.2.9 -y

dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
dnf module enable redis:remi-6.2 -y
yum install redis -y

systemctl enable redis
systemctl start redis

curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -
yum install nodejs -y

curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y

useradd roboshop

$ curl -s -L -o /tmp/user.zip "https://github.com/roboshop-devops-project/user/archive/main.zip"
$ cd /home/roboshop
$ unzip /tmp/user.zip
$ mv user-main user
$ cd /home/roboshop/user
$ npm install

mv /home/roboshop/user/systemd.service /etc/systemd/system/user.service
systemctl daemon-reload
systemctl start user
systemctl enable user
