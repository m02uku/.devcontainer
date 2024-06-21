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
ENV PATH="/usr/local/cargo/bin:/usr/local/julia/bin:/root/.codon/bin:${PATH}" \
    LANG=C \
    LANGUAGE=C \
    LC_ALL=C \
    LC_CTYPE=C
# Install additional packages
RUN apt update && apt install -y \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    curl \
    git \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
    tree \
    wget \
    unzip \
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
    && gatsby --version \
    && curl -LO https://github.com/gohugoio/hugo/releases/download/v0.127.0/hugo_extended_0.127.0_linux-amd64.deb \
    && dpkg -i hugo_extended_0.127.0_linux-amd64.deb \
    && rm hugo_extended_0.127.0_linux-amd64.deb \
    && git clone https://github.com/pyenv/pyenv.git ~/.pyenv \
    && echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc \
    && echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc \
    && echo 'eval "$(pyenv init -)"' >> ~/.bashrc