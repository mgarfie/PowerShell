@echo off
::setlocal enabledelayedexpansion  :: 启用延迟扩展
goto app5


:rem1
::for [参数] %%变量 in (集合) do (
    命令序列
)

************************************************************************************************************
************************************************************************************************************

---------参数详情---------------------
---------参数详情---------------------


1. 无参数 - 基本文件/集合迭代
作用：遍历文件集合或值列表
格式：for %%i in (集合) do 命令
2. /D - 目录迭代
作用：只匹配目录（不包含文件）
格式：for /D %%i in (目录模式) do 命令
3. /R - 递归目录遍历
作用：递归遍历目录及其子目录
格式：for /R [[目录]] %%i in (文件模式) do 命令
4. /L - 数值序列循环
作用：生成数值序列
格式：for /L %%i in (起始,步长,结束) do 命令
5. /F - 文件/命令/字符串解析
作用：解析文件内容、命令输出或字符串
格式：for /F ["选项"] %%i in (数据源) do 命令
选项详解：
选项	作用	示例
delims-xxx	指定字段分隔符（默认空格/TAB）	delims-,;（逗号或分号分隔）
tokens-x,y	选择要提取的列	tokens-1,3（提取第1和3列）
tokens-m-n	提取列范围	tokens-1-3（提取1到3列）
skip-n	跳过前n行	skip-2（跳过前2行）
eol-c	指定行注释字符（默认;）	eol-#（#开头的行为注释）
usebackq	启用扩展语法	见下方详细说明
数据源类型：
类型	格式	示例
文件	(文件名)	(data.txt)
命令输出	('命令')	('dir /b')
字符串	("字符串")	("apple,banana")
usebackq 模式：	for /F "usebackq 选项" %%i in (`命令`) do...  :: 反引号执行命令
				for /F "usebackq 选项" %%i in ("文件名") do...  :: 双引号表示文件名
				for /F "usebackq 选项" %%i in ('字符串') do...  :: 单引号表示字符串
7. 多变量支持（仅/F循环）
作用：同时提取多列数据
格式：for /F "tokens-1,2*" %%a in (...) do (
    %%a - 第一列
    %%b - 第二列
    %%c - 剩余所有列
)

-------------修饰符-----------------
-------------修饰符-----------------
	描述	示例---------------
一定注意1.如%%~f，后面是要跟循环变量的，必须配合for一起使用，假设循环变量为F那就是%%~fF,别的同理
%%~fi            :: 完整路径
%%~di            :: 驱动器号
%%~pi            :: 路径
%%~ni            :: 文件名
%%~xi            :: 扩展名
%%~ti            :: 修改时间
%%~zi            :: 文件大小

************************************************************************************************************
************************************************************************************************************

:app1

::文件遍历
for %%i in ("E:\毛玉琳\7.28\禽一片\*.mp4") do (
	echo 文件名：%%~ni
	echo 文件大小：%%~ziKB
	echo ---------------------	

)
pause

:app2

set /p num-输入一个数：
set a-1
for /l %%i in (1,1,%num%) do (
	echo 当前循环第!a!圈
	echo 当前循环数为%%i
	set /a a+-1
	echo -------------
)

pause

:app3

set "location_desktop=C:\Users\Administrator\Desktop"

for %%i in ("%location_desktop%\*.txt") do (
	
	echo 完成路径：%%~fi
	echo 文件名称：%%~ni
	echo 文件大小：%%~zi
	echo 最后修改日期：%%~ti
	echo -----------------------------
)

pause

:app4

echo ========解析csv==========

for /f "tokens=1,2 delims=,skip=1" %%i in ("E:\毛玉琳\powershell\data.csv") do (
	echo 订单编号：%%a-1
	echo 收货地区：%%a-3



)

:app5


echo ========解析csv==========
set max_count=3
set count=0

for /f "usebackq tokens=1-10 delims=, skip=1" %%a in ("E:\毛玉琳\powershell\data.csv") do (
    set /a count+=1
    
    rem 移除引号
    set "col1=%%a"
    set "col3=%%c"
    set col1=!col1:"=!
    set col3=!col3:"=!
    
    echo 订单编号：!col1!
    echo 收货地区：!col3!
    echo.
    
    rem 达到最大行数后跳出循环
    if !count! equ !max_count! goto :break
)

:break
echo 已输出 !count! 行数据
pause