#!/bin/bash
DIR=$(dirname "$0")

JAVA="$DIR/java/bin/java"
JAR="$DIR/cms-server-@CMS_VERSION@.jar"
ARCHIVE="$DIR/server.jsa"

if [ -z "$JAVA_OPTS" ]; then
  JAVA_OPTS="-Xms256m -Xmx512m -XX:+UseZGC"
fi
JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.local.only=true"

if [ -f "$ARCHIVE" ]; then
  JAVA_OPTS="$JAVA_OPTS -Xshare:on -XX:SharedArchiveFile=$ARCHIVE"
else
  JAVA_OPTS="$JAVA_OPTS -XX:ArchiveClassesAtExit=$ARCHIVE"
fi

exec "$JAVA" $JAVA_OPTS -jar "$JAR" "$@"