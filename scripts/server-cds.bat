@echo off
setlocal

set JAVA=%~dp0java\bin\java.exe
set JAR=%~dp0cms-server-@CMS_VERSION@.jar
set ARCHIVE=%~dp0server.jsa

if not defined JAVA_OPTS (
    set JAVA_OPTS=-Xms256m -Xmx512m -XX:+UseZGC -XX:+ZGenerational
)

if exist "%ARCHIVE%" (
    set JAVA_OPTS=%JAVA_OPTS% -Xshare:on -XX:SharedArchiveFile="%ARCHIVE%"
) else (
    set JAVA_OPTS=%JAVA_OPTS% -XX:ArchiveClassesAtExit="%ARCHIVE%"
)

"%JAVA%" %JAVA_OPTS% -jar "%JAR%" %*