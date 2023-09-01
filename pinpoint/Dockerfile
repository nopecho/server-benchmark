ARG PINPOINT_VERSION=2.5.2
ARG JAVA_VERSION=17

FROM pinpointdocker/pinpoint-agent:${PINPOINT_VERSION} AS pinpoint-agent

FROM amazoncorretto:${JAVA_VERSION}-alpine

# pinpoint agent args
ARG PINPOINT_VERSION=2.5.2
ARG AGENT_PATH=/pinpoint-agent
ARG PINPOINT_PROFILES_ACTIVE=release
ARG COLLECTOR_IP=host.docker.internal

# build app args
ARG PORT=10000
ARG APP_NAME
ARG FROM_JAR=build/libs/${APP_NAME}.jar

COPY --from=pinpoint-agent ${AGENT_PATH} ${AGENT_PATH}

RUN sed -i "/profiler.collector.ip=/ s/=.*/=${COLLECTOR_IP}/" \
    ${AGENT_PATH}/profiles/${PINPOINT_PROFILES_ACTIVE}/pinpoint.config && \
    sed -i "/profiler.transport.grpc.collector.ip=/ s/=.*/=${COLLECTOR_IP}/" \
    ${AGENT_PATH}/profiles/${PINPOINT_PROFILES_ACTIVE}/pinpoint.config

COPY ${FROM_JAR} app.jar

ENV JAVA_TOOL_OPTIONS=" \
-javaagent:${AGENT_PATH}/pinpoint-bootstrap-${PINPOINT_VERSION}.jar \
-Dpinpoint.agentId=${APP_NAME} \
-Dpinpoint.applicationName=${APP_NAME}-$SPRING_PROFILES_ACTIVE \
-Dpinpoint.profiler.profiles.active=${PINPOINT_PROFILES_ACTIVE} \
"

EXPOSE ${PORT}

ENTRYPOINT ["java", "-jar", "app.jar"]