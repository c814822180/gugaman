FROM openjdk:11

RUN apt-get -q update
RUN apt -f -y install xfonts-base xfonts-75dpi libxrender1 libxext6 libxcb1 libx11-6 libjpeg62-turbo locales unzip xvfb libxi6 libgconf-2-4
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
