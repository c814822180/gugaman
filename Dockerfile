FROM openjdk:11


RUN apt-get -q update
RUN apt -f -y install xfonts-base xfonts-75dpi libxrender1 libxext6 libxcb1 libx11-6 libjpeg62-turbo
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb
RUN dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb

CMD ["/bin/bash"]
