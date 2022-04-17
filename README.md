# Docker selenium chrome
## How does it work
Inside your python selenium script you must put the following option  
    chromeOptions = webdriver.ChromeOptions() 
    chromeOptions.add_argument("--remote-debugging-port=9222") 
    chromeOptions.add_argument("--remote-debugging-address=0.0.0.0") 
    chromeOptions.add_argument("--no-sandbox") 
    chromeOptions.add_argument("--disable-gpu") 
    chromeOptions.add_argument("--headless") 

The no sandbox is the most important
