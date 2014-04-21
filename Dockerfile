FROM ubuntu

MAINTAINER David Rocamora dave@n22t.com

# Updates
RUN TERM=xterm apt-get update

# We need wget to get the JRE
RUN TERM=xterm apt-get -y install wget

# Download the JRE, install it, and make it the default
RUN wget -q -O - --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u55-b13/server-jre-7u55-linux-x64.tar.gz" > /tmp/jre.tar.gz

RUN mkdir -p /usr/lib/jvm
RUN tar zxf /tmp/jre.tar.gz -C /usr/lib/jvm

RUN update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.7.0_55/bin/java" 1
RUN update-alternatives --set java /usr/lib/jvm/jdk1.7.0_55/bin/java

# Add the DataStax cassandra stuff

RUN echo "deb http://debian.datastax.com/community stable main" > /etc/apt/sources.list.d/cassandra.sources.list

RUN wget -q -O - --no-cookies --no-check-certificate http://debian.datastax.com/debian/repo_key | apt-key add -

RUN TERM=xterm apt-get update
RUN TERM=xterm apt-get -y install dsc20

EXPOSE 9160 7000