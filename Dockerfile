FROM node:9

RUN apt-get update && \
    apt-get install -y gzip git curl python libssl-dev mysql-client && \
    rm -r /var/lib/apt/lists/*

USER root

RUN cd /opt && \
    git clone https://github.com/ether/etherpad-lite && \
    cd etherpad-lite && \
    bin/installDeps.sh && \
    sed -i "s/bin\/installDeps/#bin\/installDeps/" bin/run.sh && \
    rm settings.json && \
    chmod -R g+w /opt/etherpad-lite

COPY entrypoint.sh /entrypoint.sh
VOLUME /opt/etherpad-lite/var

RUN ln -s /opt/etherpad-lite/var/settings.json /opt/etherpad-lite/settings.json

WORKDIR /opt/etherpad-lite
EXPOSE 9001
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bin/run.sh", "--root"]
