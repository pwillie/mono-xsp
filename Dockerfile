FROM pwillie/mono-runtime:5.10

# MAINTAINER Peter Wilson <pwillie@users.noreply.github.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
    mono-xsp4 \
    libdigest-perl-md5-perl \
    libmono-system-xml-linq4.0-cil \
  && rm -rf /var/lib/apt/lists/* /tmp/*

# Add Tini
ENV TINI_VERSION v0.17.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]