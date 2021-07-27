FROM ubuntu:20.04

RUN apt-get update && \
	apt-get install -y openssh-server openjdk-8-jdk wget

RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -P '' && \
    cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

COPY config/ssh_config /root/.ssh/config
COPY config/tmp /root/.ssh/tmp
RUN cat /root/.ssh/tmp > /root/.ssh/authorized_keys

CMD [ "sh", "-c", "service ssh start; bash"]