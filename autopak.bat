@echo off
cd /d %~dp0/vehicle

for /d %%d in ("./*") do (
	makeobj pak128 ../vehicle.Gal_hankyu%%d.pak ./%%d/*.dat
	@REM echo %%d 終了コード:%errorlevel%
)

cd /d %~dp0
makeobj list *.pak > addonList.txt
copy *.pak D:\Users\G_alumi\Simutrans\game\Simutrans_OTRP_test\pak128.japan_120
taskkill /t /im testrans.exe
start D:\Users\G_alumi\Simutrans\game\Simutrans_OTRP_test\testrans.exe -objects pak128.japan_120/