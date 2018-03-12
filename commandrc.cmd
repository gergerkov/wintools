@echo off
REM reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_EXPAND_SZ /d "C:\commandrc.cmd" /f

REM Creating a silently running script (no cmd window)
REM #########################################################################
REM Set WshShell = CreateObject("WScript.Shell") #
REM WshShell.Run chr(34) & "d:\programs\OpenLDAP\run\run.cmd" & Chr(34), 0 #
REM Set WshShell = Nothing #
REM #########################################################################

echo Loading Windows Tools.......[OK]

call:print "Setting up environment..."
set PROG=c:\programs
set TOOLS=%PROG%\tools
set JAVA_HOME=%PROG%\Java\jdk1.7.0._51_32
set PY_HOME=%PROG%\Python27

set MPLAYER_HOME=%PROG%\mplayer

set PATH=%PATH%;%MPLAYER_HOME%;%TOOLS%;%PROG%\bin;%M2_HOME%\bin;%PY_HOME%\Scripts;%PY_HOME%;%PY_HOME%\Tools\Scripts

REM ----------------------------------------------------

echo [OK]

call:print "Setting up Tools........."
doskey ls=dir

doskey fxget=python %TOOLS%\fxget.py
doskey cat=python %TOOLS%\cat.py

doskey cdgf=cd %GLASSFISH_HOME%
doskey gfstart=asadmin start-domain
doskey gfstop=asadmin stop-domain

doskey tail=java -cp %TOOLS%\console.jar console.Tail $1
doskey kill=java -cp %TOOLS%\console.jar console.ProcessKiller $1 $2 $3 $4 $5 $6 $7 $8 $9
doskey list=java -cp %TOOLS%\console.jar console.ProcessLister $1 $2 $3 $4 $5 $6 $7 $8 $9
echo [OK]

REM ----------------------------------------------------
goto :eof
:print
set /p=%1<nul



 
