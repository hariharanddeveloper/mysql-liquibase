@echo off
set db_username=your_database_username
set db_password=your_database_password
set db_name=college

:: Set backup and logs path relative to the batch file location and enclose in quotes to handle spaces
set "script_path=%~dp0scripts"
set "logs_path=%~dp0logs"

:: Create backup and logs directories if they don't exist
if not exist "%script_path%" (
    mkdir "%script_path%"
)

if not exist "%logs_path%" (
    mkdir "%logs_path%"
)

:: Get the current date in dd-mm-yyyy format (adapted for different date formats)
for /f "tokens=1,2,3 delims=/- " %%a in ("%date%") do (
    set day=%%a
    set month=%%b
    set year=%%c
)

:: Get the current time in hh-mm-ss format
for /F "tokens=1-3 delims=:." %%a in ("%TIME%") do (
    set hour=%%a
    set minute=%%b
    set second=%%c
)

:: Handle leading spaces in hour if it's less than 10 (fix for 24-hour format)
if %hour% lss 10 set hour=0%hour%

:: Set date-time string as dd-mm-yyyy-hh-mm-ss
set datetime=%day%-%month%-%year%-%hour%-%minute%-%second%

:: Set the paths for the backup and log files, enclosed in quotes to handle spaces
set "backup_file=%script_path%\%db_name%_backup_%datetime%.sql"
set "log_file=%logs_path%\%db_name%_log_%datetime%.log"

:: Run the mysqldump command and handle errors, use quotes around paths and files
mysqldump -u %db_username% -p%db_password% %db_name% > "%backup_file%" 2> "%log_file%"

if %errorlevel% neq 0 (
    echo Backup failed!
    echo Check %db_name%_log_%datetime%.log for details.
    type "%log_file%"
) else (
    echo Backup Complete!
)

pause
