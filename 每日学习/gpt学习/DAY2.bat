@echo off
chcp 65001 >nul

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

:end
pause
