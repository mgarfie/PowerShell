
goto app3

:app1
@echo off
:: 判断参数是否足够
if "%~1"=="" (
    echo 错误：缺少目标目录参数
    echo 用法：rename_tool.bat 目录 前缀
    goto end
)

if "%~2"=="" (
    echo 错误：缺少前缀参数
    echo 用法：rename_tool.bat 目录 前缀
    goto end
)

set "target_dir=%~1"
set "prefix=%~2"
setlocal enabledelayedexpansion
set /a count=1

:: 判断目录是否存在
if not exist "%target_dir%" (
    echo 错误：目录 %target_dir% 不存在！
    goto end
)

cd /d "%target_dir%"

for %%f in (*.txt) do (
    ren "%%f" "!prefix!_!count!.txt"
    set /a count+=1
)

echo 完成！所有 txt 文件已按前缀重命名。
goto end



:app2
@echo off
echo 用法：day.bat 要创建文件夹名称 要创建txt文件的名称
if "%~1"=="" (
	echo 文件夹名称不能为空！！
    goto end
)

if "%~2"=="" (
	echo txt文件名称不能为空！！
    goto end
)

set use_mkdir=%~1
set use_txt=%~2


if not exist %use_mkdir% (
	mkdir %use_mkdir%

)

cd %use_mkdir%

if not exist "%use_txt%.txt" (
	echo 
	echo 已经成功创造 > %~dp0%use_mkdir%\%use_txt%.txt
	
	goto end
) else (
	echo 文件已存在！！
	goto end

)








:app3
@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
set location_txt=%~dp0test\a.txt

if not exist "%location_txt%" (
	echo 文件不存在
	goto end
)


for /f "delims=" %%i in (%location_txt%) do (
	echo 读取一行：%%i
)

goto end



:end
pause
