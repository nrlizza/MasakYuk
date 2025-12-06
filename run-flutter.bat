@echo off
echo Setting Flutter environment variables...
set FLUTTER_STORAGE_BASE_URL=https://storage.googleapis.com
set PUB_HOSTED_URL=https://pub.dartlang.org

echo Running Flutter app...
flutter run

pause
