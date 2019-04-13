if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
SC STOP WSearch 
SC CONFIG WSearch  START=DISABLED
FOR /F "tokens=3" %%A IN ('sc queryex WSearch ^| findstr PID') DO (SET pid=%%A)
 IF %pid% NEQ "0" (
  taskkill /F /PID %pid%
  
 )
SC STOP dosvc
SC CONFIG dosvc START=DISABLED
FOR /F "tokens=3" %%A IN ('sc queryex dosvc ^| findstr PID') DO (SET pid=%%A)
 IF %pid% NEQ "0" (
  taskkill /F /PID %pid%
  
 )
SC STOP bits
SC CONFIG bits START=DISABLED
FOR /F "tokens=3" %%A IN ('sc queryex bits ^| findstr PID') DO (SET pid=%%A)
 IF %pid% NEQ "0" (
  taskkill /F /PID %pid%
  
 )
SC STOP wuauserv
SC CONFIG wuauserv START=DISABLED
FOR /F "tokens=3" %%A IN ('sc queryex wuauserv ^| findstr PID') DO (SET pid=%%A)
 IF %pid% NEQ "0" (
  taskkill /F /PID %pid%
  
 )