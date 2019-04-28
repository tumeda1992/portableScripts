@echo off
rem https://jj-blues.com/cms/wantto-usearray/

setlocal enabledelayedexpansion
 
set n=0
 
for /f %%s in (①実行したい文字列リスト.txt) do (
  set string[!n!]=%%s
  call ②各文字列に実行したい処理を記載してください.bat %%s
)
 
endlocal

pause