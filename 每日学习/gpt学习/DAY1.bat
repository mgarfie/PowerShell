@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

goto app4

:app1
cls

echo ======================
echo "欢迎使用我的脚本语言"
echo ======================

pause
goto app2

:app2

set /p mk=请输入要创建的文件夹名称：
mkdir "%mk%"
echo 已经创建文件夹：%mk%
pause

goto app3

:app3

if not exist test (
	mkdir test
)

move *.txt test\
echo 所有的txt已经移动到test文件夹了
pause

:app4

:::::::::::::::::::::tipe::::::::::::::::::::::::::::
::路径变量用引号包裹
::
::多行写文件第一行用 >，后面用 >>(追加)
::
::路径拼接别多写反斜杠
::
::move 目标路径用引号防止空格出错
::::::::::::::::::::::::::::::::::::::::::::::::::::


set location=%~dp0
echo %location%

if not exist "%location%test" (
	mkdir "%location%test"
)

if not exist "%location%test.txt" (
	echo 测试第1行内容 > "%location%test.txt"
	move *.txt %location%test


) else (
	echo ***********
	echo 测试第2行内容 >> "%location%test\test.txt"
	echo 测试第3行内容 >> "%location%test\test.txt"

	echo ***********

)



pause