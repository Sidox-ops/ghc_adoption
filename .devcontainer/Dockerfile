FROM dart

RUN apt-get update && apt-get upgrade
RUN apt-get install -y curl git unzip xz-utils zip libglu1-mesa

# RUN wget https://dl-ssl.google.com/linux/linux_signing_key.pub -O /tmp/google.pub
#     gpg --no-default-keyring \
#             --keyring /etc/apt/keyrings/google-chrome.gpg \
#             --import /tmp/google.pub
#     echo 'deb [arch=amd64 signed-by=/etc/apt/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
#     sudo apt-get update -y; sudo apt-get install -y google-chrome-stable

RUN apt-get clean

RUN git clone https://github.com/flutter/flutter.git -b stable --depth 1 /flutter
ENV PATH="/flutter/bin:$PATH"
RUN flutter doctor