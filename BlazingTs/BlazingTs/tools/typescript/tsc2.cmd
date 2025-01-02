@ECHO off
SET "LOG_FILE=%~dp0\typescript.log"
ECHO [TypeScript] Starting compilation... > "%LOG_FILE%"
GOTO start
:find_dp0
SET dp0=%~dp0
EXIT /b
:start
SETLOCAL
CALL :find_dp0

IF EXIST "%dp0%\node.exe" (
  SET "_prog=%dp0%\node.exe"
) ELSE (
  SET "_prog=node"
  SET PATHEXT=%PATHEXT:;.JS;=;%
)

ECHO [TypeScript] Using Node from: %_prog% >> "%LOG_FILE%"

REM Version check
FOR /F "tokens=2 delims= " %%A IN ('"%_prog%" "%dp0%\bin\tsc" --version') DO (
    ECHO [TypeScript] Version %%A >> "%LOG_FILE%"
)

REM Transpilation
ECHO [TypeScript] Running tsc with arguments: %* >> "%LOG_FILE%"
"%_prog%" "%dp0%\bin\tsc" %* >> "%LOG_FILE%" 2>&1

IF %ERRORLEVEL% EQU 0 (
    ECHO [TypeScript] Compilation completed successfully >> "%LOG_FILE%"
) ELSE (
    ECHO [TypeScript] Compilation failed with error code %ERRORLEVEL% >> "%LOG_FILE%"
)

endLocal