import requests
from bs4 import BeautifulSoup

# Replace 'your_url_here' with the URL of the webpage you want to scrape
url = 'https://docs.fivem.net/docs/game-references/vehicle-models/'

# Send an HTTP GET request to the URL
response = requests.get(url)

# Check if the request was successful
if response.status_code == 200:
    # Parse the HTML content of the page using BeautifulSoup
    soup = BeautifulSoup(response.text, 'html.parser')

    # Find all <code> tags in the HTML
    code_tags = soup.find_all('code')

    # Initialize a list to store the words within <code> tags
    words_in_code_tags = []

    # Extract words from each <code> tag
    for code_tag in code_tags:
        # Split the text within the <code> tag into words
        words = code_tag.get_text().split()
        words_in_code_tags.extend(words)

    # Specify the file name where you want to save the results
    output_file = 'code_words.txt'

    # Write the extracted words to the output file
    with open(output_file, 'w') as file:
        for word in words_in_code_tags:
            # Wrap each word in single quotes and add a comma at the end of each line
            file.write(f"'{word}',\n")

    print(f"Results saved to {output_file}")
else:
    print(f"Failed to retrieve the webpage. Status code: {response.status_code}")
