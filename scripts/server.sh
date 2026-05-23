#!/bin/bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"

if [ -z "$JAVA_OPTS" ]; then
  JAVA_OPTS="-Xms256m -Xmx512m -XX:+UseZGC"
fi
JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.local.only=true"

exec "$DIR/java/bin/java" $JAVA_OPTS -jar "$DIR/cms-server-8.1.0.jar" "$@"