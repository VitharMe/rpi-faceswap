FROM balenalib/raspberry-pi-debian:latest

MAINTAINER Vithar Me <vithar@vithar.me>

RUN apt-get update && apt-get upgrade -y && apt-get install -y --fix-missing \
    python3 \
    python3-dev \
    python3-pip \
    python-pip \
    libpng-dev \
    libjpeg-dev \
    p7zip-full \
    git \
    qemu-user-static \
    python3-setuptools \
    build-essential  \
    wget \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*
RUN pip3 install --upgrade \
    pillow \
    python-slugify \
    psutil \
    raven
RUN mkdir /kindlegen && \
    cd /kindlegen && \
    wget http://kindlegen.s3.amazonaws.com/kindlegen_linux_2.6_i386_v2_9.tar.gz && \
    tar zxvf kindlegen_linux_2.6_i386_v2_9.tar.gz
RUN cd / && git clone https://github.com/ciromattia/kcc && \
    cd /kcc && \
    cp /kindlegen/kindlegen /kcc/kindlegen
COPY convert.sh /kcc/.
RUN chmod +x /kcc/convert.sh
CMD ["/kcc/convert.sh"]
