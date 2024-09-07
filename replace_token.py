import os

# Read the token from environment variables
token = os.getenv('DISCORD_TOKEN')

# Define the file to modify
file_path = 'main.py'

# Read the content of the file
with open(file_path, 'r') as file:
    content = file.read()

# Replace the placeholder with the actual token
new_content = content.replace('TOKEN = "REPLACEME"', f'TOKEN = "{token}"')

# Write the modified content back to the file
with open(file_path, 'w') as file:
    file.write(new_content)
