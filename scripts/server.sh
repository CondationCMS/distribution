#!/bin/bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"

if [ -z "$JAVA_OPTS" ]; then
  JAVA_OPTS="-Xms256m -Xmx512m -XX:+UseZGC"
fi

exec "$DIR/java/bin/java" $JAVA_OPTS -jar "$DIR/cms-server-8.1.0.jar" "$@"