ARG DEBIAN_BASE_IMAGE_TAG="bookworm-slim"
ARG NODE_BASE_IMAGE_TAG="22-bookworm-slim"
ARG PYTHON_BASE_IMAGE_TAG="3.12-slim-bookworm"

# Stage 0: Base image
FROM debian:${DEBIAN_BASE_IMAGE_TAG} AS base
# Install curl to download Hatch in the next stage

# Stage 1: Hatch installation
FROM base AS hatch
# Install Hatch from the latest release, unpack, and add it to the PATH
RUN apt install -y \
    curl
RUN curl -OL https://github.com/pypa/hatch/releases/latest/download/hatch-x86_64-unknown-linux-gnu.tar.gz \
    && tar -xvzf hatch-x86_64-unknown-linux-gnu.tar.gz \
    && mv hatch /usr/local/bin \
    && rm hatch-x86_64-unknown-linux-gnu.tar.gz

# Stage 2: Node installation
FROM node:${NODE_BASE_IMAGE_TAG} AS node
# No additional steps required as Node and npm are already installed in this image

# Stage 3: Final image
FROM python:${PYTHON_BASE_IMAGE_TAG}
# Set the working directory
WORKDIR /workdir
# Copy Hatch and Node installations from the previous stages
COPY --from=hatch /usr/local /usr/local
COPY --from=node /usr/local /usr/local
# Install git and verify Hatch installation and cleanup
RUN apt update && apt install -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/* \
    && hatch