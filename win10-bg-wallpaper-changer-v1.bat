@echo off

REM PLEASE DO NO REMOVE "REM" BEFORE THE TEXTS, BECAUSE THATS THE COMMENT MAN.

rem YOU MIGHT WANT TO CHANGE THE DIRECTORY OF THE BACKGROUND PICTURES
rem change the "C:\Users\user\Pictures\YourPictures" part for goodness sake.
REM CHANGE TO THE DIRECTORY YOU WANT, I PREFER THE FOLDER AND THE PICTURES ARE STILL IN THE C: DRIVE
REM EXAMPLE: set "folder_path=C:\Users\Admin\Documents\AnimePictures"
rem Example above shows that the folder is located in a documents folder.

set "folder_path=C:\Users\user\Pictures\YourPictures"
setlocal EnableDelayedExpansion

REM Create an array of image file paths in the specified folder
set i=0
for %%a in ("%folder_path%\*.jpg") do (
    set /A i+=1
    set "image[!i!]=%%a"
)

Check if the folder contains at least 5 image files
if !i! LSS 5 (
   echo Error: The specified folder contains less than 5 image files.
   goto :EOF
)

REM Randomly select an image file from the array
set /A "rand_num=(%random% %% i) + 1"
set "image_path=!image[%rand_num%]!"

REM Update the desktop wallpaper using the selected image
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%image_path%" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters



rem echo Desktop background image changed to "%image_path%"

rem pause


rem if you have problems, please ask me.