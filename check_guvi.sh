#!/bin/bash

# URL to check
URL="https://www.guvi.in"

# Use curl to get the HTTP status code
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" $URL)

# Print the HTTP status code
echo "HTTP Status Code: $HTTP_CODE"

# Determine if the request was successful or not
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "Success: The request was successful!"
elif [ "$HTTP_CODE" -ge 400 ] && [ "$HTTP_CODE" -lt 500 ]; then
    echo "Client Error: The request failed with a client error."
elif [ "$HTTP_CODE" -ge 500 ] && [ "$HTTP_CODE" -lt 600 ]; then
    echo "Server Error: The request failed with a server error."
else
    echo "Other Response: Received an unexpected response."
fi

