FROM ubuntu:16.04

ARG uid=1000

# Install environment
RUN apt-get update -y && apt-get install -y \
	git \
	wget \
	python3.5 \
	python3-pip \
	python-setuptools \
	python3-nacl \
	apt-transport-https \
	ca-certificates \
	supervisor \
	gettext-base \
	software-properties-common

RUN pip3 install -U \
	pip==9.0.3 \
	setuptools

RUN pip uninstall setuptools -y

RUN pip3 install -U \
	pip==9.0.3 \
	setuptools
	
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE7709D068DB5E88 || \
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CE7709D068DB5E88
ARG indy_stream=stable
RUN echo "deb https://repo.sovrin.org/deb xenial $indy_stream" >> /etc/apt/sources.list
RUN add-apt-repository "deb https://repo.sovrin.org/sdk/deb xenial $indy_stream"

RUN useradd -ms /bin/bash -u $uid indy

ARG indy_plenum_ver=1.12.1
ARG indy_node_ver=1.12.1
ARG python3_indy_crypto_ver=0.4.5
ARG indy_crypto_ver=0.4.5
ARG python3_pyzmq_ver=18.1.0

RUN apt-get update -y && apt-get install -y \
	python3-pyzmq=${python3_pyzmq_ver} \
	indy-plenum=${indy_plenum_ver} \
	indy-node=${indy_node_ver} \
	python3-indy-crypto=${python3_indy_crypto_ver} \
	libindy-crypto=${indy_crypto_ver} \
	vim \
	nano \
	libindy \
	indy-cli

USER indy

RUN awk '{if (index($1, "NETWORK_NAME") != 0) {print("NETWORK_NAME = \"sandbox\"")} else print($0)}' /etc/indy/indy_config.py> /tmp/indy_config.py
RUN mv /tmp/indy_config.py /etc/indy/indy_config.py

EXPOSE 9701 9702
