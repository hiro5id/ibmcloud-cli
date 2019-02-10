FROM ubuntu

WORKDIR /root
RUN apt-get update
RUN apt-get install -y curl screen
RUN curl -sL https://ibm.biz/idt-installer | bash
# RUN curl -sL https://raw.githubusercontent.com/IBM-Bluemix/developer-tools-installer/master/linux-installer/idt-installer | bash