FROM centos:7

# STARDOG_HOME is user data directory
ENV STARDOG_HOME=/stardog STARDOG_SERVER_JAVA_ARGS="-Xmx8g -Xms8g -XX:MaxDirectMemorySize=12g"

# Install stardog from its repo
RUN curl http://packages.stardog.com/rpms/stardog.repo > /etc/yum.repos.d/stardog.repo && \
    yum install -y stardog-7.6.4 && \
    yum install -y git

# User data directory for $STARDOG_HOME
VOLUME ["/stardog"]
RUN cd stardog && \
    git clone https://github.com/linhd-postdata/OntoPoetry.git && \
    cd ..
# Potential volume for license key to be lifted at runtime
# VOLUME ["/stardog-license"]

# Add the stardog zip file and license if present
# COPY stardog-license-key.bin /stardog-license/stardog-license-key.bin

EXPOSE 5820

# COPY config.sh .

RUN java -version

# remove locks, always replace license key if present, start stardog
CMD rm -f $STARDOG_HOME/system.lock || true && \
    # cp -f /stardog-license/stardog-license-key.bin $STARDOG_HOME 2>/dev/null || true && \
    # cp -f /stardog/stardog-license-key.bin $STARDOG_HOME 2>/dev/null || true && \
    /opt/stardog/bin/stardog-admin server start || true && \
    sh /stardog/config.sh
