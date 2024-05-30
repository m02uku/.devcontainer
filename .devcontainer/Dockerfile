# Stage 1: Install pyenv, poetry, Node.js, npm
FROM python:3.9-slim-bookworm as builder

# Install dependencies required for pyenv and poetry
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev \
    python-openssl \
    git

# Install pyenv
RUN curl https://pyenv.run | bash

# Set environment variables for pyenv
ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

# Install the latest Python version and set it as default
RUN pyenv install 3.9.5
RUN pyenv global 3.9.5

# Install poetry
RUN curl -sSL https://install.python-poetry.org | python -

# Install Node.js and npm
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Stage 2: Build the final image
FROM debian:bookworm-slim

# Copy pyenv and poetry installations from the previous stage
COPY --from=builder /root/.pyenv /root/.pyenv
COPY --from=builder /root/.poetry /root/.poetry

# Set environment variables for pyenv and poetry
ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

# Install Node.js and npm
RUN apt-get update && apt-get install -y nodejs

# Set the working directory
WORKDIR /workdir
