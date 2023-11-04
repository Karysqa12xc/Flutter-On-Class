// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA47csp7kpQxaP4drJPjWBjm-CcL4C-B9w',
    appId: '1:1089344153786:web:49d7082834a4f6f7467a83',
    messagingSenderId: '1089344153786',
    projectId: 'test-firebase-444d9',
    authDomain: 'test-firebase-444d9.firebaseapp.com',
    storageBucket: 'test-firebase-444d9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBaixQE190TZ4XuB9qiK1FgLxj-ipUnWMo',
    appId: '1:1089344153786:android:e2c1ce0597b24d2a467a83',
    messagingSenderId: '1089344153786',
    projectId: 'test-firebase-444d9',
    storageBucket: 'test-firebase-444d9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCloALK9MuBXIxJ5gDTTPuxaGlnlT4TYng',
    appId: '1:1089344153786:ios:d48a7e79afbfe5c1467a83',
    messagingSenderId: '1089344153786',
    projectId: 'test-firebase-444d9',
    storageBucket: 'test-firebase-444d9.appspot.com',
    iosBundleId: 'com.example.flutterspaceTestFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCloALK9MuBXIxJ5gDTTPuxaGlnlT4TYng',
    appId: '1:1089344153786:ios:85fbb254bc7493fe467a83',
    messagingSenderId: '1089344153786',
    projectId: 'test-firebase-444d9',
    storageBucket: 'test-firebase-444d9.appspot.com',
    iosBundleId: 'com.example.flutterspaceTestFirebase.RunnerTests',
  );
}