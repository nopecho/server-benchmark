# pinpoint agent
ARG PINPOINT_VERSION=2.5.2
ARG AGENT_PATH=/pinpoint-agent
ARG PINPOINT_PROFILES_ACTIVE=local
FROM pinpointdocker/pinpoint-agent:${PINPOINT_VERSION} AS pinpoint-agent

# build app
ARG JAVA_VERSION=17
ARG PORT=5000
ARG APP_NAME
ARG FROM_JAR=build/libs/${APP_NAME}.jar
FROM amazoncorretto:${JAVA_VERSION}-alpine

COPY --from=pinpoint-agent $AGENT_PATH $AGENT_PATH

COPY ${FROM_JAR} /app.jar

ENV APP_NAME=${APP_NAME}

ENV PINPOINT_PROFILES_ACTIVE=${PINPOINT_PROFILES_ACTIVE}

ENV JAVA_TOOL_OPTIONS="
-Dpinpoint.container
-Dpinpoint.agentId=$(APP_NAME)
-Dpinpoint.applicationName=$(APP_NAME)-$(SPRING_PROFILES_ACTIVE)
-Dpinpoint.profiler.profiles.active=$(PINPOINT_PROFILES_ACTIVE)
"

EXPOSE ${PORT}

ENTRYPOINT ["java", "-jar", "/app.jar", "-javaagent:${AGENT_PATH}/pinpoint-bootstrap-${PINPOINT_VERSION}.jar"]