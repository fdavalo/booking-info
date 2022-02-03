FROM image-registry.openshift-image-registry.svc:5000/openshift/ubi8:latest
RUN mkdir -p /opt/gradle
WORKDIR /opt/gradle
RUN curl -o gradle.zip https://services.gradle.org/distributions/gradle-7.3.3-bin.zip
RUN unzip -d gradle.zip
RUN mkdir -p /app/src
COPY . /app/src
ENV PATH=$PATH:/opt/gradle/gradle-7.3.3/bin
RUN cd /app/src && gradle build

FROM java:latest
COPY --from=0  /app/src/reviews-application/build/libs/reviews-application-1.0.war./ /tmp/deployments
