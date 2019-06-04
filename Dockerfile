FROM arm32v7/python:3.6-slim-stretch

MAINTAINER Vithar Me <vithar@vithar.me>

RUN apt-get update && apt-get upgrade -y && apt-get install -y --fix-missing \
    build-essential \
    cmake \
    gfortran \
    git \
    wget \
    curl \
    graphicsmagick \
    libgraphicsmagick1-dev \
    libatlas-dev \
    libavcodec-dev \
    libavformat-dev \
    libgtk2.0-dev \
    libjpeg-dev \
    liblapack-dev \
    libswscale-dev \
    pkg-config \
    python3-dev \
    python3-numpy \
    software-properties-common \
    zip \
    python-opencv \
    libopenblas-dev \
    libatlas-base-dev \
    libx11-dev \
    libgtk-3-dev \
    python-pip \
    python-dev \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*
RUN pip2 install dlib
RUN cd ~ && git clone https://github.com/VitharMe/faceswap && \
    cd ~/faceswap && \
    wget http://sourceforge.net/projects/dclib/files/dlib/v18.10/shape_predictor_68_face_landmarks.dat.bz2 && \
    bzip2 -d shape_predictor_68_face_landmarks.dat.bz2
COPY move.sh /root/.
RUN chmod +x /root/move.sh
CMD ["/root/move.sh"]
