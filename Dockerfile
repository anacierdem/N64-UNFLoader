FROM ubuntu:24.04 AS dependencies

RUN apt-get update && apt-get install \
    git \
    build-essential \
    libncurses5-dev \
    libncursesw5-dev \
    libftdi1-dev \
    libusb-1.0-0-dev \
    libudev-dev \
    -yq

USER ubuntu

FROM dependencies

WORKDIR /unf

COPY --chown=ubuntu:ubuntu . .

WORKDIR /unf/UNFLoader
RUN make