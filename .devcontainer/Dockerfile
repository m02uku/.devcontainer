ARG DEBIAN_BASE_IMAGE_TAG="bookworm-slim"
ARG NODE_BASE_IMAGE_TAG="22-bookworm-slim"
ARG PYTHON_BASE_IMAGE_TAG="3.12-slim-bookworm"
ARG RUST_BASE_IMAGE_TAG="1.79-slim-bookworm"
ARG JULIA_BASE_IMAGE_TAG="1.10-bookworm"

# Stage 0: Base image
FROM debian:${DEBIAN_BASE_IMAGE_TAG} AS base
# Set the default shell to bash
SHELL ["/bin/bash", "-c"]
# Set the PATH environment variable
ENV PATH="/usr/local/cargo/bin:/usr/local/julia/bin:/root/.codon/bin:${PATH}"
# Install additional packages
RUN apt update && apt install -y \
    build-essential \
    curl \
    git \
    tree \
    && rm -rf /var/lib/apt/lists/*

# Stage 1: Node installation
FROM node:${NODE_BASE_IMAGE_TAG} AS node

# Stage 2: Rust installation
FROM rust:${RUST_BASE_IMAGE_TAG} AS rust

# Stage 3: Julia installation
FROM julia:${JULIA_BASE_IMAGE_TAG} AS julia

# Stage 4: Python installation
FROM python:${PYTHON_BASE_IMAGE_TAG} AS python

# Stage 5: Final image
FROM base
# Copy installed binaries from previous stages
COPY --from=node /usr/local/ /usr/local/
COPY --from=rust /usr/local/cargo/ /usr/local/cargo/
COPY --from=julia /usr/local/julia/ /usr/local/julia/
COPY --from=python /usr/local/ /usr/local/
RUN rustup default stable \ 
    && yes | /bin/bash -c "$(curl -fsSL https://exaloop.io/install.sh)" \
    && npm install -g gatsby-cli \
    && curl -LO https://github.com/gohugoio/hugo/releases/download/v0.127.0/hugo_extended_0.127.0_linux-amd64.deb \
    && dpkg -i hugo_extended_0.127.0_linux-amd64.deb \
    && rm hugo_extended_0.127.0_linux-amd64.deb