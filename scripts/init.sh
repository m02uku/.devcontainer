#!/bin/bash

# Check if no arguments are provided
if [ $# -eq 0 ]; then
    echo "Warning: No options provided."
    exit 1
fi

# Parse command line options and execute corresponding scripts
for arg in "$@"
do
  case $arg in
    --dev)
      submodules/devcontainer/scripts/devcontainer.sh
      ;;
    --py)
      submodules/devcontainer/scripts/python_env.sh
      ;;
    --src)
      submodules/devcontainer/scripts/src.sh
      ;;
    --mod)
      submodules/devcontainer/scripts/submodule.sh
      ;;
    --all)
      submodules/devcontainer/scripts/devcontainer.sh
      submodules/devcontainer/scripts/python_env.sh
      submodules/devcontainer/scripts/src.sh
      submodules/devcontainer/scripts/submodule.sh
      ;;
    *)
      echo "Unknown option: $arg"
      ;;
  esac
done