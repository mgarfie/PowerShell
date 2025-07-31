@echo off
chcp 65001 >nul

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

:end
pause
