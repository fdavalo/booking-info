FROM image-registry.openshift-image-registry.svc:5000/openshift/ubi8-openjdk-11:1.3
RUN mkdir -p /opt/maven
WORKDIR /opt/maven
RUN curl -L -o maven.zip https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.zip
RUN unzip maven.zip
RUN mkdir -p /opt/app/src
COPY --chown=jboss . /opt/app/src
ENV PATH=$PATH:/opt/maven/apache-maven-3.9.4/bin
RUN cd /opt/app/src && mvn package

FROM image-registry.openshift-image-registry.svc:5000/openshift/jboss-webserver54-openjdk11-tomcat9-openshift-ubi8:latest
COPY --from=0  /opt/app/src/target/reviews.war /deployments/ROOT.war
