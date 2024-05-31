ARG PYTHON_BASE_IMAGE_TAG="3.12-slim-bookworm"
ARG NODE_BASE_IMAGE_TAG="22-bookworm-slim"
ARG DEBIAN_BASE_IMAGE_TAG="bookworm-slim"

# Stage 1: Base image
FROM python:${PYTHON_BASE_IMAGE_TAG} as python
# Install Hatch
RUN pip install hatch

# Stage 2: Node installation
FROM node:${NODE_BASE_IMAGE_TAG} as node
# No additional steps required as Node and npm are already installed in this image

# Stage 3: Final image
FROM debian:${DEBIAN_BASE_IMAGE_TAG}
# Set the working directory
WORKDIR /workdir
# Copy Python and Node installations from previous stages
COPY --from=python /usr/local /usr/local
COPY --from=node /usr/local /usr/local
# Install necessary dependencies
RUN apt update \
    && apt install -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*