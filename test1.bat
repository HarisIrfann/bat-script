@ECHO OFF

ECHO msiexec /passive /l*v  C:\temp\ca-install.log /i "E:\Support\QRM-
ECHO Software\QRM_CA_16_1_2917T_Install\Installers\CA 16.1.2917T\QRM Central Administration 2019 Q4 Update 2917_T.msi" INSTALLLOCATION="E:\QRM\Central Administration" 
ECHO REGISTERAGAINSCA="smrczccdwcas002" SQLSERVERNAME="smrczccdwdbs002"
ECHO SQLDATABASE="CAv16DB" SQLCREDENTIALSUSERNAME="qrmsvc"
ECHO SQLCREDENTIALSPASSWORD="Fall2019" CASERVICEDOMAIN="office"
ECHO CASERVICEUSERNAME="SMRCLAAPPSRVC" CASERVICEPASSWORD="Bgy65Fdr4Vbj7Y5D8"
ECHO ADDLOCAL="CentralAdminServer,CentralAdminClient,QrmHpcIntegrationService"
ECHO HPCSERVICEDOMAIN="office" HPCSERVICEUSERNAME="SMRCLAAPPSRVC"
ECHO HPCSERVICEPASSWORD="Bgy65Fdr4Vbj7Y5D8" CAADMINUSERDOMAIN="office"
ECHO CAADMINUSERNAME="ROL-SMRCTNOADMINS" CAHOSTNAME="smrczccdwcas002" CAPORT="1820"
ECHO Copy-Item "E:\QRM\Central Administration\HPC\Qrm.Hpc.IntegrationServer.exe.config"
ECHO "E:\QRM\Central Administration\HPC\Qrm.Hpc.IntegrationServer.exe.config.$(Get-Date -f yyyyMMdd)" -Force
ECHO (Get-Content "E:\QRM\Central Administration\HPC\Qrm.Hpc.IntegrationServer.exe.config") | ForEach-Object {$_ -replace "Impersonation","ConnectAsServiceClient"} | Set-Content 
ECHO "E:\QRM\Central Administration\HPC\Qrm.Hpc.IntegrationServer.exe.config"
ECHO Restart-Service HpcIntegrationService
ECHO $WScriptShell = New-Object -ComObject WScript.Shell
ECHO $TargFileQRMCA = "E:\QRM\Central Administration\CentralAdminClientMain.exe"
ECHO $ShortcutFileQRMCA = "$env:Public\Desktop\QRM Central Administration.lnk"
ECHO $ShortcutQRMCA = $WScriptShell.CreateShortcut($ShortcutFileQRMCA)
ECHO $ShortcutQRMCA.TargetPath = $TargFileQRMCA
ECHO $ShortcutQRMCA.WorkingDirectory = "E:\QRM\Central Administration\"
ECHO $ShortcutQRMCA.Save()
ECHO "d:\Support\QRM-Software\QRMCA2019Q4Fix.exe" /auto
ECHO D:\Support\MISC\ReportViewer.exe /q
ECHO msiexec /quiet /i D:\support\QRM-Software\SQL2016_AS_ADOMD.msi /norestart
ECHO msiexec /quiet /i D:\support\QRM-Software\SQL2016_AS_AMO.msi /norestart
ECHO mkdir M:\WorkingFolder
ECHO New-SMBShare -Name WorkingFolder -Path "M:\WorkingFolder" -FullAccess "office\ROL-SMRCTNOADMINS","office\ROL-qrmadministrators","office\rol-qrmusers","Authenticated Users"
ECHO &CACLS "M:\WorkingFolder" "/E" "/T" "/C" "/G" "office\ROL-SMRCTNOADMINS:F" "office\ROL-qrmadministrators:F" "office\rol-qrmusers:F"
ECHO mkdir I:\MSSQL\Backup\Manual
ECHO New-SMBShare -Name SQLBackup -Path "I:\MSSQL\Backup\" -FullAccess "office\ROL-SMRCTNOADMINS","office\ROL-qrmadministrators","Authenticated Users"
ECHO &CACLS "I:\MSSQL\Backup" "/E" "/T" "/C" "/G" "office\ROL-SMRCTNOADMINS:R" "office\ROL-qrmadministrators:R"
ECHO &CACLS "I:\MSSQL\Backup\Manual" "/E" "/T" "/C" "/G" "office\ROL-SMRCTNOADMINS:F" "office\ROL-qrmadministrators:F"
ECHO msiexec /passive /l*v  C:\temp\ca-install.log /i "E:\Support\QRM-
ECHO Software\QRM_CA_16_1_2917T_Install\Installers\CA 16.1.2917T\QRM Central Administration 2019 Q4 Update 2917_T.msi" INSTALLLOCATION="E:\QRM\Central Administration" 
ECHO REGISTERAGAINSCA="smrczccdwcas002" ADDLOCAL="CentralAdminClient
ECHO CAADMINUSERDOMAIN="office" CAADMINUSERNAME="ROL-SMRCTNOADMINS"
ECHO CAHOSTNAME="smrczccdwcas002" CAPORT="1820"
ECHO New-SMBShare -Name QRM -Path "E:\QRM" -FullAccess Everyone
ECHO &CACLS "E:\QRM" "/E" "/C" "/T" "/G" "office\ROL-SMRCTNOADMINS:F" "office\ROL-qrmadministrators:F" "office\ROL-qrmusers:F"
ECHO $WScriptShell = New-Object -ComObject WScript.Shell
ECHO $TargFileQRMCA = "E:\QRM\Central Administration\CentralAdminClientMain.exe"
ECHO $ShortcutFileQRMCA = "$env:Public\Desktop\QRM Central Administration.lnk"
ECHO $ShortcutQRMCA = $WScriptShell.CreateShortcut($ShortcutFileQRMCA)
ECHO $ShortcutQRMCA.TargetPath = $TargFileQRMCA
ECHO $ShortcutQRMCA.WorkingDirectory = "E:\QRM\Central Administration\"
ECHO $ShortcutQRMCA.Save()
ECHO "d:\Support\QRM-Software\QRMCA2019Q4Fix.exe" /auto
ECHO D:\Support\MISC\ReportViewer.exe /q
ECHO msiexec /quiet /i D:\support\QRM-Software\SQL2016_AS_ADOMD.msi /norestart
ECHO msiexec /quiet /i D:\support\QRM-Software\SQL2016_AS_AMO.msi /norestart

ECHO SUCCESS