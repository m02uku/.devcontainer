# Create a virtual environment
python3 -m venv .venv

source .venv/bin/activate

if [ -f requirements.txt ]; then
  pip install -r requirements.txt
else
  echo "No requirements.txt file found"
fi

echo "**Python environment created!**"
