#this script used to common script to DRY

StatusCheck(){
  if[$? -eq 0]; then
    echo -e "\e[32mSuccess\e[0m"
  else
    echo -e "\e[31mFailure\e[0m"
    exit 1
  fi
}
NODES(){

  echo Setting NodeJS repo
  curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/${COMPONENT}.log
  StatusCheck

  echo Installing NodeJS
  yum install nodejs -y &>>/tmp/${COMPONENT}.log
  StatusCheck

  id roboshop &>>/tmp/${COMPONENT}.log
  if [$? -ne 0 ]; then
    echo Adding Application User
    useradd roboshop &>>/tmp/${COMPONENT}.log
    StatusCheck
  fi

  echo Downloading application content
  curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/roboshop-devops-project/${COMPONENT}/archive/main.zip" &>>/tmp/${COMPONENT}.log
  cd /home/roboshop &>>/tmp/${COMPONENT}.log
  StatusCheck

  echo Cleaning old application content
  rm -rf ${COMPONENT} >>/tmp/${COMPONENT}.log
  StatusCheck

  echo Extracting Application
  unzip -o /tmp/${COMPONENT}.zip >>/tmp/${COMPONENT}.log && mv ${COMPONENT}-main ${COMPONENT} >>/tmp/${COMPONENT}.log && mv ${COMPONENT}-main ${COMPONENT} >>/tmp/${COMPONENT}.log
  StatusCheck

  echo Installing nodeJS Dependencies
  npm install >>/tmp/${COMPONENT}.log
  StatusCheck
}