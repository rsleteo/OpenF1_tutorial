#!/bin/bash

# Reset script for Python project

echo "Resetting Python project environment..."

# 1. Delete virtual environment folders
rm -rf venv .venv env

# 2. Delete environment and config files
rm -f .env requirements.txt

# 3. Delete Python cache files
find . -type d -name "__pycache__" -exec rm -r {} + 2>/dev/null
find . -name "*.pyc" -delete

# 4. Create a new virtual environment
python3 -m venv venv
source venv/bin/activate

# 5. Install required packages
pip install --quiet python-dotenv

# 6. Create a fresh .env file
cat <<EOF > .env
BASE_API_URL=https://api.openf1.org/v1/
EOF

# 7. Confirm setup
echo "Environment reset complete."
echo "Virtual environment: ./venv"
echo ".env file created with BASE_API_URL"
echo "Installed packages:"
pip list

# 8. Optional: create placeholder app.py if it doesn’t exist
if [ ! -f app.py ]; then
  cat <<EOF > app.py
from dotenv import load_dotenv
import os

load_dotenv()
base_url = os.getenv("BASE_API_URL")
print(f"Base API URL: {base_url}")
EOF
  echo "Created 'app.py' starter file."
fi

echo "To start coding, activate your environment with:"
echo "source venv/bin/activate"
