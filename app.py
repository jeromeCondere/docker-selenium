from seleniumwire import webdriver  # Import from seleniumwire

# Create a new instance of the Chrome driver
chromeOptions = webdriver.ChromeOptions() 
chromeOptions.add_argument("--remote-debugging-port=9222") 

driver = webdriver.Chrome(chrome_options=chromeOptions)

# Go to the Google home page
driver.get('https://www.google.com')

# Access requests via the `requests` attribute
for request in driver.requests:
    if request.response:
        print(
            request.url,
            request.response.status_code,
            request.response.headers['Content-Type']
        )
