ARG DEBIAN_BASE_IMAGE_TAG="bookworm-slim"
ARG NODE_BASE_IMAGE_TAG="22-bookworm-slim"
ARG PYTHON_BASE_IMAGE_TAG="3.12-slim-bookworm"

# Stage 1: Node installation
FROM node:${NODE_BASE_IMAGE_TAG} AS node
# No additional steps required as Node and npm are already installed in this image

# Stage 2: Python installation and Hatch installation
FROM python:${PYTHON_BASE_IMAGE_TAG}
# Set the working directory
WORKDIR /workdir
# Install additional packages
RUN apt update && apt install -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/* \
    && curl -OL https://github.com/pypa/hatch/releases/latest/download/hatch-x86_64-unknown-linux-gnu.tar.gz \
    && tar -xvzf hatch-x86_64-unknown-linux-gnu.tar.gz \
    && mv hatch /usr/local/bin \
    && rm hatch-x86_64-unknown-linux-gnu.tar.gz
# Copy the Node and npm binaries from the Node image
COPY --from=node /usr/local /usr/local