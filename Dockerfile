FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ARG LANG="C.UTF-8"

WORKDIR /workspace/

RUN apt-get update; \
	apt-get upgrade -y; \
	apt-get install -y \
		software-properties-common \
		meson \
		libgst-dev \
		libgstreamer1.0-dev \
		libgstreamer-plugins-base1.0-dev \
		gstreamer1.0-tools \
		gstreamer1.0-plugins-good \
		gstreamer1.0-plugins-bad \
		gstreamer1.0-plugins-ugly \
		python3-dev \
		python3-pip \
		libglib2.0-dev \
		libcairo2-dev \
		locales \
		git \
		nano \
		vim \
		wget \
		axel;

RUN set -eu; \
	add-apt-repository ppa:nnstreamer; \
	apt-get update; \
	apt-get upgrade -y; \
	apt-get install -y \
		nnstreamer \
		nnstreamer-example \
		libprotobuf-dev;

RUN set -eu; \
	git clone --recursive https://github.com/nnsuite/nnstreamer-example; \
	cd nnstreamer-example; \
	cd bash_script; \
	bash example_models/get-model.sh object-detection-tf;
	#meson build; \
	#cd build; \
	#ninja; \
	#cd ..; \
	#meson install; \
	#cd bash_script/; \
	#bash example_models/get-model-object-detection-tf.sh;


WORKDIR /workspace/nnstreamer-example/bash_script/

CMD ["/bin/bash"]
