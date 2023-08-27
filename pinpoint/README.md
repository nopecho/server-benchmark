# Pinpoint
https://pinpoint-apm.gitbook.io/pinpoint/

* 오픈소스 APM 도구
* 3가지 컴포넌트
  * `collector` : `agent` 가 보낸 정보 분석하고 `HBase` 스토리지에 저장
  * `agent` : 우리가 개발한 애플리케이션에 사이드카 형태로 붙어서 트래픽 정보를 `collector` 로 전달
  * `web-ui` : `HBase` 에 있는 모니터링 정보를 웹 UI로 제공

## Server Run

> *Dependency*
> * *docker*
> * *docker-compose V1*

<br>

```shell
make up

make open
```

---
## Agent Setting

### Java

빌드용 Dockerfile
```dockerfile
ARG PINPOINT_VERSION=2.5.2
ARG JAVA_VERSION=17

FROM pinpointdocker/pinpoint-agent:${PINPOINT_VERSION} AS pinpoint-agent

FROM amazoncorretto:${JAVA_VERSION}-alpine

# pinpoint agent args
ARG PINPOINT_VERSION=2.5.2
ARG AGENT_PATH=/pinpoint-agent
ARG PINPOINT_PROFILES_ACTIVE=release
ARG COLLECTOR_IP=host.docker.internal
ARG AGENT_DEBUG_LEVEL=INFO

# build app args
ARG PORT=10000
ARG APP_NAME
ARG FROM_JAR=build/libs/${APP_NAME}.jar

COPY --from=pinpoint-agent ${AGENT_PATH} ${AGENT_PATH}

RUN sed -i "/profiler.collector.ip=/ s/=.*/=${COLLECTOR_IP}/" \
    ${AGENT_PATH}/profiles/${PINPOINT_PROFILES_ACTIVE}/pinpoint.config && \
    sed -i "/profiler.transport.grpc.collector.ip=/ s/=.*/=${COLLECTOR_IP}/" \
    ${AGENT_PATH}/profiles/${PINPOINT_PROFILES_ACTIVE}/pinpoint.config && \
    sed -i "/Root level=/ s/=.*/=${AGENT_DEBUG_LEVEL}/" \
    ${AGENT_PATH}/profiles/${PINPOINT_PROFILES_ACTIVE}/log4j2.xml

COPY ${FROM_JAR} app.jar

ENV JAVA_TOOL_OPTIONS=" \
-javaagent:${AGENT_PATH}/pinpoint-bootstrap-${PINPOINT_VERSION}.jar \
-Dpinpoint.agentId=${APP_NAME} \
-Dpinpoint.applicationName=${APP_NAME}-$SPRING_PROFILES_ACTIVE \
-Dpinpoint.profiler.profiles.active=${PINPOINT_PROFILES_ACTIVE} \
"

EXPOSE ${PORT}

ENTRYPOINT ["java", "-jar", "app.jar"]
```

<br>

#### Example
Build
```shell
docker build \
--build-arg APP_NAME={your builded jar name} \
--build-arg JAVA_VERSION=17 \
--build-arg PORT=10000 \
--build-arg PINPOINT_PROFILES_ACTIVE=local \
--build-arg COLLECTOR_IP=host.docker.internal \
-t example:tag \
.
```

Run
```shell
docker run \
-e "SPRING_PROFILES_ACTIVE=local" \
-p 10000:10000 \
example:tag
```

### Node

TBD