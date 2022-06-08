FROM centos:7.2.1511

# FROM scratch
# MAINTAINER The CentOS Project <cloud-ops@centos.org>
# ADD centos-7.2.1511-docker.tar.xz /

LABEL name="GB-From-CentOS"
# LABEL vendor="CentOS"
# LABEL license=GPLv2

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#install golang
RUN curl -SL -o /usr/local/src/go1.9.3.linux-amd64.tar.gz  https://dl.google.com/go/go1.9.3.linux-amd64.tar.gz && tar -C /usr/local -xzf /usr/local/src/go1.9.3.linux-amd64.tar.gz
#RUN curl -SL -o /usr/local/src/go1.9.3.linux-amd64.tar.gz  https://go.dev/dl/go1.9.3.linux-amd64.tar.gz \
#COPY ./go1.9.3.linux-amd64.tar.gz  /usr/local/src/go1.9.3.linux-amd64.tar.gz    && tar -C /usr/local -xzf /usr/local/src/go1.9.3.linux-amd64.tar.gz
#ADD ./go1.9.3.linux-amd64.tar.gz /usr/local 

ENV PATH=$PATH:/usr/local/go/bin:/root/go/bin

#install git
RUN  yum -y install git

# Install gb.
RUN go get github.com/constabulary/gb/... && \
        go install github.com/constabulary/gb

COPY ./request.go  /usr/local/go/src/net/http/request.go

VOLUME ["/project"]

WORKDIR /project/

CMD ["./build.sh"]
