:user_configuration

:: About AIR application packaging
:: http://livedocs.adobe.com/flex/3/html/help.html?content=CommandLineTools_5.html#1035959
:: http://livedocs.adobe.com/flex/3/html/distributing_apps_4.html#1037515

:: NOTICE: all paths are relative to project root

:: Your certificate information
set CERT_NAME="Test"
set CERT_PASS=fd
set CERT_FILE="cert\Test.p12"
set SIGNING_OPTIONS=-storetype pkcs12 -keystore %CERT_FILE% -storepass %CERT_PASS%
set ICONS=icons/AIR

:: Android packaging
set AND_ICONS=icons/android

:: iOS packaging
set IOS_DIST_CERT_FILE=
set IOS_DEV_CERT_FILE=
set IOS_DEV_CERT_PASS=
set IOS_PROVISION=cert\Test.mobileprovision
set IOS_ICONS=icons/ios

set IOS_DEV_SIGNING_OPTIONS=-storetype pkcs12 -keystore "%IOS_DEV_CERT_FILE%" -storepass %IOS_DEV_CERT_PASS% -provisioning-profile %IOS_PROVISION%
set IOS_DIST_SIGNING_OPTIONS=-storetype pkcs12 -keystore "%IOS_DIST_CERT_FILE%" -provisioning-profile %IOS_PROVISION%

:: Application descriptor
set APP_XML=application.xml

:: Files to package
set APP_DIR="bin\AIR"
set FILE_OR_DIR=-C %APP_DIR% .

set MOBILE_APP_DIR="bin\Mobile"
set MOBILE_FILE_OR_DIR=-C %MOBILE_APP_DIR% .

:: Your application ID (must match <id> of Application descriptor)
set APP_ID=Test

:: Output
set DIST_PATH=dist
set DIST_NAME=Test

:: Debugging using a custom IP
set DEBUG_IP=


:validation
%SystemRoot%\System32\find /C "<id>%APP_ID%</id>" "%APP_XML%" > NUL
if errorlevel 1 goto badid
goto end

:badid
echo.
echo ERROR: 
echo   Application ID in 'bat\SetupApplication.bat' (APP_ID) 
echo   does NOT match Application descriptor '%APP_XML%' (id)
echo.
if %PAUSE_ERRORS%==1 pause
exit

:end
