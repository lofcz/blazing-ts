@ECHO off
SET "LOG_FILE=%~dp0typescript.log"
ECHO [TypeScript] Starting compilation... > "%LOG_FILE%"

SET "dp0=%~dp0"

IF EXIST "%dp0%node.exe" (
  SET "_prog=%dp0%node.exe"
) ELSE (
  SET "_prog=node"
)

ECHO [TypeScript] Using Node from: %_prog% >> "%LOG_FILE%"

REM Version check
FOR /F "tokens=* usebackq" %%i IN (`%_prog% "%dp0%bin\tsc" --version`) DO (
    SET "VERSION_LINE=%%i"
    ECHO [TypeScript] %%i >> "%LOG_FILE%"
)

REM Transpilation
ECHO [TypeScript] Running tsc with arguments: %* >> "%LOG_FILE%"
"%_prog%" "%dp0%bin\tsc" %* >> "%LOG_FILE%" 2>&1

IF %ERRORLEVEL% EQU 0 (
    ECHO [TypeScript] Compilation completed successfully >> "%LOG_FILE%"
) ELSE (
    ECHO [TypeScript] Compilation failed with error code %ERRORLEVEL% >> "%LOG_FILE%"
)