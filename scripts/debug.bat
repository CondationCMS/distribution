@echo off
setlocal
set JAVA=%~dp0java\bin\java.exe
set JAR=%~dp0cms-server-@CMS_VERSION@.jar

if not defined JAVA_OPTS (
    set JAVA_OPTS=-Xms256m -Xmx512m
)

"%JAVA% -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:8000 " %JAVA_OPTS% -jar "%JAR%" %*