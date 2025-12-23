@echo off
echo ========================================
echo   Mendapatkan SHA-1 Fingerprint
echo ========================================
echo.
cd android
echo Menjalankan gradlew signingReport...
echo.
gradlew.bat signingReport
echo.
echo ========================================
echo SELESAI!
echo.
echo Cari bagian "Variant: debug" di output di atas
echo Lalu COPY nilai SHA1 (contoh: A1:B2:C3:D4...)
echo.
echo Gunakan SHA1 tersebut untuk konfigurasi di:
echo https://console.cloud.google.com/
echo ========================================
pause
