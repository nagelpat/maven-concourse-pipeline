FROM debian
RUN apt-get update && apt-get install -y make ca-certificates

ADD bin/terraform /usr/bin/terraform
ADD Makefile  /Makefile

WORKDIR /data
VOLUME ["/data"]

CMD ["make", "-f", "/Makefile" ]
