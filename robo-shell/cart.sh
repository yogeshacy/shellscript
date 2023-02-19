#!/usr/bin/env bash
#set -e
source common.sh
COMPONENT = cart
NODES

mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service >>/tmp/cart.log && systemctl daemon-reload >>/tmp/cart.log
StatusCheck

systemctl start cart >>/tmp/cart.log && systemctl enable cart >>/tmp/cart.log
StatusCheck
