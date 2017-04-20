FROM 	phusion/baseimage:latest
MAINTAINER	bedefaced

ENV 	BUILD_DEPS autoconf file gcc git libc-dev make pkg-config git iproute2

RUN 	set -x && \
	apt-get update && \
	apt-get install -y $BUILD_DEPS --no-install-recommends && \
	mkdir -p /tmp/3proxy

COPY 	3proxy.cfg /etc/3proxy.cfg

RUN 	set -x && \
	cd /tmp/3proxy && \
	git clone https://github.com/z3APA3A/3proxy.git && \
	cd 3proxy && \
	git checkout master && \
	sed -i -r 's/(^CFLAGS.*)/\1 -DANONYMOUS=1/g' Makefile.Linux && \
	make -f Makefile.Linux && \
	make -f Makefile.Linux install

RUN	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT	[ "/usr/local/bin/3proxy", "/etc/3proxy.cfg" ]
