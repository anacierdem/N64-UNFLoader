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

FROM dependencies AS builder

USER ubuntu

WORKDIR /unf

COPY --chown=ubuntu:ubuntu . .

WORKDIR /unf/UNFLoader
RUN make

# Final minimal image
FROM ubuntu:24.04
COPY --from=builder /unf/UNFLoader/UNFLoader /unf/UNFLoader/UNFLoader