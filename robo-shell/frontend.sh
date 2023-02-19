#!/usr/bin/env bash

source common.sh
COMPONENT=frontend

echo installing Nginx
yum install nginx -y
StatusCheck

DOWNLOADING

echo Cleaning old content
cd /usr/share/nginx/html && rm -rf *
StatusCheck

echo Extracting Download old content
unzip -o /tmp/frontend.zip &>>${LOG} && mv frontend-main/static/* . && mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf
StatusCheck

systemctl restart nginx &>>${LOG} && systemctl enable nginx &>>${LOG}

