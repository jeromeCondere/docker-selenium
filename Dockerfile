FROM python:3.8-slim

ENV PYTHON_SCRIPT=app.py

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install -U setuptools
RUN pip install --no-cache-dir -r requirements.txt



# Update the package list and install chrome
RUN apt-get update -y
RUN apt-get install -y wget xvfb unzip
RUN apt-get install -y gnupg2


# Set up the Chrome PPA
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get update -y
RUN apt-get install -y google-chrome-stable
RUN apt-get install -y \
    fontconfig \
    fonts-ipafont-gothic \
    fonts-wqy-zenhei \
    fonts-thai-tlwg \
    fonts-kacst \
    fonts-symbola \
    fonts-noto \
    fonts-freefont-ttf


# Set up Chromedriver Environment variables
ENV CHROMEDRIVER_VERSION=100.0.4896.60
ENV CHROMEDRIVER_DIR=/chromedriver
RUN mkdir $CHROMEDRIVER_DIR

# Download and install Chromedriver
RUN wget -q --continue -P $CHROMEDRIVER_DIR "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip"
RUN unzip $CHROMEDRIVER_DIR/chromedriver* -d $CHROMEDRIVER_DIR
RUN  chmod 777 /chromedriver/chromedriver


EXPOSE 9222
EXPOSE 80

ENV PATH="/chromedriver:${PATH}"

ENTRYPOINT python $PYTHON_SCRIPT



