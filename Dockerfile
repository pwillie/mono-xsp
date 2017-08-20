FROM debian:jessie-slim

# MAINTAINER Peter Wilson <pwillie@users.noreply.github.com>

# based on:
# MAINTAINER Jo Shields <jo.shields@xamarin.com>
# MAINTAINER Alexander Köplinger <alkpli@microsoft.com>

# based on dockerfile by Michael Friis <friism@gmail.com>

ENV MONO_VERSION 5.0.1.1

RUN apt-get update \
  && apt-get install -y curl \
  && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

RUN echo "deb http://download.mono-project.com/repo/debian jessie/snapshots/$MONO_VERSION main" > /etc/apt/sources.list.d/mono-official.list \
  && apt-get update \
  # && apt-get install -y binutils mono-devel ca-certificates-mono fsharp mono-vbnc nuget referenceassemblies-pcl \
  && apt-get install -y \
    mono-xsp4 \
    ca-certificates-mono \
    libmono-system-xml-linq4.0-cil \
  && rm -rf /var/lib/apt/lists/* /tmp/*
