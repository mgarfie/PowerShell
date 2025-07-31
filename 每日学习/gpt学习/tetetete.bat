@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

goto app4


:app4

set location=%~dp0
echo 当前脚本目录是：%location%

if not exist "%location%test" (
    mkdir "%location%test"
)

if not exist "%location%test.txt" (
    echo 测试第一行内容 > "%location%test.txt"
)

move "%location%*.txt" "%location%test"

pause