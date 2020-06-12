FROM openjdk:11

ADD ./sources.list ./sources.list
RUN rm /etc/apt/sources.list && cp ./sources.list /etc/apt/
RUN apt-get -q update
RUN apt -f -y install xfonts-base xfonts-75dpi libxrender1 libxext6 libxcb1 libx11-6 libjpeg62-turbo locales unzip xvfb libxi6 libgconf-2-4 \
        xdg-utils  libxss1 libxrandr2 libxcursor1 libxcomposite1 libpangocairo-1.0-0 libpango-1.0-0 libnss3 \
        libnspr4 libgtk-3-0 libgdk-pixbuf2.0-0 libgbm1 libcups2 libcairo2 libatspi2.0-0 libatk1.0-0 libatk-bridge2.0-0 \
        libasound2 libappindicator3-1 fonts-liberation libxtst6
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb
RUN dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb
RUN wget https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip && rm chromedriver_linux64.zip && mv -f chromedriver /usr/local/bin/chromedriver && chmod +x /usr/local/bin/chromedriver
RUN sed -ie 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/g' /etc/locale.gen
RUN locale-gen
RUN mkdir /usr/share/fonts/truetype/siyuan/
ADD ./fonts/*.ttc /usr/share/fonts/truetype/siyuan/
RUN fc-cache -vf
RUN fc-list
ENV LANG zh_CN.UTF-8


CMD ["/bin/bash"]

