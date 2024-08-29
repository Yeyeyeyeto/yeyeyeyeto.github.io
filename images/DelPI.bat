@echo off
setlocal enabledelayedexpansion

REM 指定要修改文件名的目录
set "dir_path=E:\Eternal\blog\source\images"

REM 切换到指定目录
cd /d "%dir_path%"

REM 遍历所有文件
for %%f in (*.*) do (
    set "filename=%%~nf"
    set "extension=%%~xf"

    REM 检查文件名中是否包含 "Pasted image "
    echo "!filename!" | findstr /c:"Pasted image " >nul
    if not errorlevel 1 (
        REM 移除 "Pasted image " 字符串
        set "newname=!filename:Pasted image =!"

        REM 重命名文件
        ren "%%f" "!newname!!extension!"
    )
)

echo 完成
pause
