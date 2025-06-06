FROM alpine:3.19.0

ARG terraform_version="1.11.0"

# install terraform.
RUN wget https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_amd64.zip && \
    unzip ./terraform_${terraform_version}_linux_amd64.zip -d /usr/local/bin/ && \
    rm ./terraform_${terraform_version}_linux_amd64.zip

# install awscli
RUN apk add --no-cache aws-cli

# set time-zone=JST
RUN apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

# create workspace directory
RUN mkdir -p /root/src

# move to workspace
WORKDIR /root/src