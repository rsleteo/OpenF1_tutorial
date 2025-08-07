from dotenv import load_dotenv
import os

load_dotenv()
base_url = os.getenv("BASE_API_URL")
print(f"Base API URL: {base_url}")
