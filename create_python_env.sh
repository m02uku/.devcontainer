# Description: Create a Python environment for a devcontainer
git submodule update --init --recursive

# Create a virtual environment
python3 -m venv .venv
touch requirements.txt

# Create .gitignore
touch .gitignore
echo ".devcontainer" >> .gitignore
echo ".vscode" >> .gitignore
echo "devcontainer" >> .gitignore
