FROM azul/zulu-openjdk-alpine:8

WORKDIR /project
COPY . .
RUN ./gradlew assemble -PsonatypeUsername -PsonatypePassword

FROM liferay/portal:7.4.3.52-ga52

COPY --chown=liferay:liferay --from=0 /project/build/libs/*.jar /mnt/liferay/files/osgi/modules/
