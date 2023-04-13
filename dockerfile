FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y tzdata && \
    apt-get install -y \
    cmake \
    make \
    python \
    python3 \
    libboost-all-dev \
    git \
    gcc \
    g++

#ARG DEBIAN_FRONTEND=noninteractive
RUN mkdir /app
WORKDIR /app
COPY /src/* .
RUN make . && make
CMD ./output && tail -f /dev/null
