
goto app3

:app1
@echo off
:: �жϲ����Ƿ��㹻
if "%~1"=="" (
    echo ����ȱ��Ŀ��Ŀ¼����
    echo �÷���rename_tool.bat Ŀ¼ ǰ׺
    goto end
)

if "%~2"=="" (
    echo ����ȱ��ǰ׺����
    echo �÷���rename_tool.bat Ŀ¼ ǰ׺
    goto end
)

set "target_dir=%~1"
set "prefix=%~2"
setlocal enabledelayedexpansion
set /a count=1

:: �ж�Ŀ¼�Ƿ����
if not exist "%target_dir%" (
    echo ����Ŀ¼ %target_dir% �����ڣ�
    goto end
)

cd /d "%target_dir%"

for %%f in (*.txt) do (
    ren "%%f" "!prefix!_!count!.txt"
    set /a count+=1
)

echo ��ɣ����� txt �ļ��Ѱ�ǰ׺��������
goto end



:app2
@echo off
echo �÷���day.bat Ҫ�����ļ������� Ҫ����txt�ļ�������
if "%~1"=="" (
	echo �ļ������Ʋ���Ϊ�գ���
    goto end
)

if "%~2"=="" (
	echo txt�ļ����Ʋ���Ϊ�գ���
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
	echo �Ѿ��ɹ����� > %~dp0%use_mkdir%\%use_txt%.txt
	
	goto end
) else (
	echo �ļ��Ѵ��ڣ���
	goto end

)








:app3
@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
set location_txt=%~dp0test\a.txt

if not exist "%location_txt%" (
	echo �ļ�������
	goto end
)


for /f "delims=" %%i in (%location_txt%) do (
	echo ��ȡһ�У�%%i
)

goto end



:end
pause
