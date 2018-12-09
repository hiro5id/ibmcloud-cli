FROM ubuntu

RUN apt-get update
RUN apt-get install -y curl screen
RUN curl -sL https://ibm.biz/idt-installer | bash
RUN mkdir -p /workdir
WORKDIR /workdir