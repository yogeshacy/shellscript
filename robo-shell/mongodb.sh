#!/usr/bin/env bash

source common.sh
COMPONENT=mongodb

echo setup yum repo
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>${LOG}
StatusCheck

echo Install MongoDB
yum install -y mongodb-org &>>${LOG}
StatusCheck

echo start MongoDB servie
systemctl enable mongod &>>${LOG} && systemctl start mongod &>>${LOG}
StatusCheck

DOWNLOADING

echo Extracting schema file
cd /tmp &>>${LOG} && unzip -o mongodb.zip &>>${LOG}
StatusCheck

echo Load Schema
cd mongodb-main &>>${LOG} && mongo < catalogue.js &>>${LOG} && mongo < users.js &>>${LOG}
StatusCheck
