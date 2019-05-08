FROM ubuntu:16.04

WORKDIR /root/

COPY sources-16.04.list /etc/apt/sources.list
COPY repo /usr/bin/repo

RUN apt-get update && \
    apt-get install -y openjdk-8-jdk git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
        lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip python bc imagemagick ccache schedtool && \
    rm -rf /var/cahce/apt && \
    rm -rf /var/lib/apt/lists && \
    chmod a+x /usr/bin/repo

# No ENTRYPOINT or CMD be provided. You should run this image as a shell like 'docker run -it --rm <image> bash', it has a completed building environment, but maybe not supports legacy Android versions (e.g. 4.x).
# There aren't any command to download or build sources as well, you should mount a host path to download and build them. Remember, this image only provides a build environment.
ENTRYPOINT [ "sh", "-c" ]
