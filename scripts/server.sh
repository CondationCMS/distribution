#!/bin/bash
DIR=$(dirname "$0")

if [ -z "$JAVA_OPTS" ]; then
  JAVA_OPTS="-Xms256m -Xmx512m -XX:+UseZGC -XX:+ZGenerational"
fi

"$DIR/java/bin/java" $JAVA_OPTS -jar "$DIR/cms-server-@CMS_VERSION@.jar" "$@"