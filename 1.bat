@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion


set "TL=兔立康"
set "FZ=防啄先锋"
set "QY=禽一片"
set "GL=钙磷二十八补"
set "YJ=养鸡小妙招"
set "YT=养兔小妙招"
set "QC=全蟲净"
set "GY=鸽一片"
set "GX=鸽新肽"
set "TY=兔一滴"
set "TK=脱壳离子钙"
set "ZD=增蛋宝"
set "YG=鱼肝油"
set "WY=温益清"
set "DY=独易清"


echo 可选产品变量名:
echo --------------------------
for /f "tokens=1,2 delims==" %%a in ('set ^| findstr /i "TL FZ QY GL YJ YT QC GY GX TY TK ZD YG WY DY"') do (
    echo %%a = %%b
)
echo --------------------------


:input_loop
set /p "userInput=请输入产品缩写（如 TL/FZ）或自定义名称: "
if "!userInput!"=="" (
    echo 错误：输入不能为空！
    goto input_loop
)


set "productName=!userInput!"
for /f "tokens=1,2 delims==" %%A in ('set ^| findstr /i "!userInput!"') do (
    if /i "%%A"=="!userInput!" set "productName=%%B"
)


for /f "tokens=2 delims==" %%a in ('wmic os get localdatetime /value ^| findstr "="') do (
    set "datetime=%%a"
)
set /a mm=1!datetime:~4,2! - 100
set /a dd=1!datetime:~6,2! - 100
set "prefix=!mm!月!dd!日"
echo 当前日期前缀: !prefix!

set "extensions=mp4 mov avi mkv flv wmv"

set cnt=1
for %%x in (%extensions%) do (
    for /f "delims=" %%f in ('dir /b /a-d *.%%x 2^>nul') do (
        call :safe_rename "%%f" "!prefix!_!productName!!cnt!.%%x"
        set /a cnt+=1
    )
)
goto :end

:safe_rename
    set "oldFile=%~1"
    set "newFile=%~2"
    ren "!oldFile!" "!newFile!" 2>nul && (
        echo 成功: "!oldFile!" → "!newFile!"
        goto :eof
    )

    for %%s in ("!oldFile!") do (
        if exist "%%~snxs" (
            ren "%%~snxs" "!newFile!" && (
                echo 成功（短名称）: "%%~snxs" → "!newFile!"
            ) || (
                echo 错误: 无法重命名 "%%~snxs"
                pause
                exit /b
            )
        )
    )
    goto :eof

:end
set /a total=cnt-1
echo 完成！共处理 !total! 个文件（使用日期前缀: !prefix!）。
pause