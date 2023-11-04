# flutterspace_test_firebase

A new Flutter project.
## Getting Started
* Lệnh lấy mã SHA1 cho firebase: 
keytool -list -v -keystore "C:\Users\HP\\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android

Thêm lệnh này vào **build.gradle** trong folder **android** có `buildscript`
`classpath 'com.google.gms:google-services:4.3.8'`
Tiếp tục thêm lệnh này vào file **build.gradle** trong folder  **android** vào phần phía trên android{}: 
`apply plugin: 'com.google.gms.google-services'` 
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
