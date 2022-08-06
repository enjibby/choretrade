ARG BUILD_FROM=homeassistant/amd64-base
FROM $BUILD_FROM

# Install requirements for add-on
RUN apk add --no-cache python3

# Python 3 HTTP Server serves the current working dir
# So let's set it to our add-on persistent data directory.
WORKDIR /data

# Copy data for add-on
COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
