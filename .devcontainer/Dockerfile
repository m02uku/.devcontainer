# Stage 1: Base image
FROM debian:bookworm-slim AS base
# Set the working directory
WORKDIR /workdir

# Stage 2: Install pyenv and Python
FROM base AS python-builder
# Install dependencies for building Python
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
liblzma-dev
# Install pyenv
RUN curl https://pyenv.run | bash
# Set environment variables for pyenv
ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
# Install the latest Python version and set it as the default
RUN pyenv install 3.9.5
RUN pyenv global 3.9.5

# Stage 3: Install poetry
FROM python-builder AS poetry-builder
# Install poetry
RUN curl -sSL https://install.python-poetry.org | bash
# Set environment variables for poetry
ENV POETRY_HOME "/poetry"
ENV PATH $POETRY_HOME/bin:$PATH

# Stage 4: Install Node and npm
FROM poetry-builder AS node-builder
# Install Node.js and npm
RUN apt install -y nodejs npm

# Stage 5: Final image
FROM base AS final
# Copy Python from python-builder
COPY --from=python-builder /root/.pyenv /root/.pyenv
# Copy poetry from poetry-builder
COPY --from=poetry-builder /poetry /poetry
# Copy Node.js and npm from node-builder
COPY --from=node-builder /usr/bin/node /usr/bin/node
COPY --from=node-builder /usr/bin/npm /usr/bin/npm
# Set environment variables for pyenv and poetry
ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
ENV POETRY_HOME "/poetry"
ENV PATH $POETRY_HOME/bin:$PATH