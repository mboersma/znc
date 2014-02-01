# mboersma/znc

FROM stackbrew/ubuntu:12.04
MAINTAINER Matt Boersma <matt@sprout.org>

ENV DEBIAN_FRONTEND noninteractive

# install ZNC build prerequisites
RUN apt-get install -yq --force-yes g++ libssl-dev make
# build and install ZNC
ADD http://znc.in/releases/znc-1.2.tar.gz /
RUN tar xzvf znc-1.2.tar.gz
RUN cd znc-1.2 && ./configure
RUN cd znc-1.2 && make
RUN cd znc-1.2 && make install
# clean up
RUN rm -rf znc-1.2*
RUN apt-get remove -yq g++ libssl-dev make
RUN apt-get autoremove -yq && apt-get clean

# run ZNC as an unprivileged user
RUN useradd -m -d /opt/znc znc
ADD run /opt/znc/run
RUN chmod +x /opt/znc/run
RUN chown -R znc:znc /opt/znc

# run thie image as a ZNC server
USER znc
WORKDIR /opt/znc
CMD ['/opt/znc/run']
