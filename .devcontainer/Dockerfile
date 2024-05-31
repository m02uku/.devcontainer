ARG DEBIAN_BASE_IMAGE_TAG="bookworm-slim"
# ARG PYTHON_BASE_IMAGE_TAG="3.12-slim-bookworm"
ARG NODE_BASE_IMAGE_TAG="22-bookworm-slim"

# # Stage 1: Base image
# FROM python:${PYTHON_BASE_IMAGE_TAG} as python
# # Install Hatch
# RUN pip install hatch

# Stage 0: Base image
FROM debian:${DEBIAN_BASE_IMAGE_TAG} as base
# Install necessary dependencies
RUN apt update \
    && apt install -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Stage 1: Python installation
FROM base as hatch
# Install Hatch from the latest release, unpack, and add it to the PATH
RUN curl -OL https://github.com/pypa/hatch/releases/latest/download/hatch-x86_64-unknown-linux-gnu.tar.gz \
    && tar -xvzf hatch-x86_64-unknown-linux-gnu.tar.gz \
    && mv hatch /usr/local/bin

# Stage 2: Node installation
FROM node:${NODE_BASE_IMAGE_TAG} as node
# No additional steps required as Node and npm are already installed in this image

# Stage 3: Final image
FROM base
# Set the working directory
WORKDIR /workdir
# Copy Python and Node installations from previous stages
COPY --from=python /usr/local /usr/local
COPY --from=node /usr/local /usr/local
