FROM registry.gitlab.jt.jtgroup:5005/devops/springboot-image:latest
COPY target/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar /usr/local/lib/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar
COPY elastic-apm-agent-1.29.0.jar /usr/local/lib/elastic-apm-agent-1.29.0.jar

RUN find / -perm +6000 -type f -exec chmod a-s {} \; || true
RUN apt-get update -y
RUN apt-get install -y dumb-init

RUN apt install tzdata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ENV TZ=Asia/Amman

RUN groupadd -g 102 orange \
    && useradd -r -g orange -u 10001 orange
 
USER orange

EXPOSE 8080
ENTRYPOINT java -Dhttps.proxyHost=10.1.166.202 -Dhttps.proxyPort=8080 -jar /usr/local/lib/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar
