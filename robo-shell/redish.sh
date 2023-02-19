#!/usr/bin/env bash

source common.sh
COMPONENT=redis

echo setup yum repo
curl -L https://raw.githubusercontent.com/roboshop-devops-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo &>>${LOG}
StatusCheck

echo Instal Redis
yum install redis-6.2.9 -y &>>${LOG}
StatusCheck

echo Start Redis service
systemctl enable redis &>>${LOG} && systemctl start redis &>>${LOG}
