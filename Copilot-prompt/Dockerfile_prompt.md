# Python(Poetry), Node, npm

Create Dockerfile according to conditions below:

-   **[IMPORTANT] Reduce the size of the final image as much as possible.**
-   Use multi-stage build.
-   Write comments for each step in the Dockerfile.
-   Install pyenv and set the default Python version to latest release.
-   Install poetry and set the default Python version to latest release.
-   Intall Node and npm.
-   Set the working directory to /workdir.
-   Use debian:bookworm-slim as the base image for the final image.

# Python(Hatch), Node, npm

Create new Dockerfile according to conditions below:

-   **[IMPORTANT] Reduce the size of the final image and time to build as much as possible.**
-   Use multi-stage build.
-   Write comments for each step in the Dockerfile.
-   Install **Hatch** ([Documentation](https://hatch.pypa.io/latest/)) as Python project manager, and set the default Python version to latest release.
-   Do not install Python globally.
-   Do not use `pip` to install hatch.
-   Intall **Node** and **npm**.
-   Set the working directory to **/workdir**.
-   Use **debian:bookworm-slim** as the base image for the final image.
-   **Do not COPY unrequired files to final image.** COPY files only required for this environment.
