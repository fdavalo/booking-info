FROM image-registry.openshift-image-registry.svc:5000/openshift/ubi8-openjdk-11:1.3
RUN mkdir -p /opt/gradle
WORKDIR /opt/gradle
RUN curl -L -o gradle.zip https://services.gradle.org/distributions/gradle-7.3.3-bin.zip
RUN unzip gradle.zip
RUN mkdir -p /opt/app/src
RUN id
COPY --chown=jboss /opt/app/src
ENV PATH=$PATH:/opt/gradle/gradle-7.3.3/bin
RUN cd /opt/app/src && ls -altr * && gradle build

FROM java:latest
COPY --from=0  /opt/app/src/reviews-application/build/libs/reviews-application-1.0.war./ /tmp/deployments
