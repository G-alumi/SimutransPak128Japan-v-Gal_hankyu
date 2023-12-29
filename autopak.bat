@echo off
cd /d %~dp0

for /d %%d in ("./*") do (
	cd %%~pfd/src
	makeobj pak128 ../../vehicle.Gal_hankyu%%d.pak
	echo %%d 終了コード:%errorlevel%
	cd /d %~dp0
)

cd /d %~dp0
makeobj list *.pak > addonList.txt
copy *.pak D:\Users\G_alumi\Simutrans\game\Simutrans_OTRP_test\pak128.japan_120
taskkill /t /im testrans.exe
start D:\Users\G_alumi\Simutrans\game\Simutrans_OTRP_test\testrans.exe -objects pak128.japan_120/ -pause