FROM ubuntu:18.04
RUN apt-get update \
        && apt-get install -y git libfontconfig phantomjs nodejs npm sqlite3 libsqlite3-dev\
	&& git clone https://github.com/frangoteam/FUXA.git && cd FUXA/server \
        && npm install \
        && apt-get purge -y libfontconfig && apt-get autoremove -y \
        && rm -rf /var/lib/apt/lists/*  && \
    npm install --build-from-source --sqlite=/usr/bin sqlite3

ADD . /usr/src/app/FUXA
WORKDIR /usr/src/app/FUXA/server
EXPOSE 1881
CMD [ "npm", "start" ]
