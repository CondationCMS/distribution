#!/bin/bash
DIR=$(dirname "$0")

if [ -z "$JAVA_OPTS" ]; then
  JAVA_OPTS="-Xms256m -Xmx512m"
fi

"$DIR/java/bin/java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:8000 " $JAVA_OPTS -jar "$DIR/cms-server-@CMS_VERSION@.jar" "$@"