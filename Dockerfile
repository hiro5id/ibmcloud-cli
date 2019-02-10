FROM ubuntu

WORKDIR /root
RUN apt-get update
RUN apt-get install -y curl screen
RUN curl -sL https://ibm.biz/idt-installer | bash
# RUN curl -sL https://raw.githubusercontent.com/IBM-Bluemix/developer-tools-installer/master/linux-installer/idt-installer | bash

# ---- Ensure that container-service "cs" plugin is installed
# First we will ensure that any installed version is removed
RUN rm -rf /root/.bluemix/plugins/container-service || true
# Now let's install the plugin
RUN ibmcloud plugin install container-service