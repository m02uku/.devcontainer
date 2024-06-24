cd "$(dirname "$0")"

bash devcontainer/scripts/devcontainer.sh
bash devcontainer/scripts/submodule.sh
bash devcontainer/scripts/python_env.sh