import json
from datetime import datetime, timedelta
import random

# Read the list of words from the file
with open('commonwords.txt', 'r') as file:
    words = [line.strip() for line in file.readlines() if len(line.strip()) == 4]

# Start date
start_date = datetime(2023, 10, 22)

# End date
end_date = datetime(2024, 12, 31)

# Generate the word-date pairs
word_list = []

current_date = start_date
while current_date < end_date and words:
    word = random.choice(words)
    words.remove(word)
    word_list.append({"word": word, "date": current_date.strftime("%m/%d/%Y")})
    current_date += timedelta(days=1)

# Create the JSON file
data = {"words": word_list}
with open('wordsgenerated.json', 'w') as json_file:
    json.dump(data, json_file, indent=2)

print("JSON file 'wordsgenerated.json' has been created!")
