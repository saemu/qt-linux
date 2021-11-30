FROM ubuntu:20.04

COPY qt-installer-noninteractive.qs /tmp
RUN apt-get update -qq && \
DEBIAN_FRONTEND=noninteractive apt-get install -qq -y curl build-essential libgl1-mesa-dev libfontconfig1 libdbus-1-3 libglib2.0-0 && \
curl -OL https://download.qt.io/archive/qt/5.9/5.9.3/qt-opensource-linux-x64-5.9.3.run && \
chmod +x qt-opensource-linux-x64-5.9.3.run && \
./qt-opensource-linux-x64-5.9.3.run --platform minimal --script /tmp/qt-installer-noninteractive.qs && \
rm -rf /var/lib/apt/lists/*
ENV PATH=/qt/5.9.3/gcc_64/bin:$PATH