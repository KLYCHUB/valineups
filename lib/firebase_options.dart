// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAiXEAOXrZX8_tms9bA3uSmTn5Ynb1waNU',
    appId: '1:460791088203:web:5762a6edd4a9784832b9ce',
    messagingSenderId: '460791088203',
    projectId: 'valineups-2024',
    authDomain: 'valineups-2024.firebaseapp.com',
    storageBucket: 'valineups-2024.appspot.com',
    measurementId: 'G-RCBBNE6S50',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBV101K1bu6YNYp4Uz6J71jDlL00A75p_M',
    appId: '1:460791088203:android:554efef6188e586332b9ce',
    messagingSenderId: '460791088203',
    projectId: 'valineups-2024',
    storageBucket: 'valineups-2024.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAnsLEtabcoPeybsgWEjg7q1o0WJpN0ujs',
    appId: '1:460791088203:ios:86344ce381470bee32b9ce',
    messagingSenderId: '460791088203',
    projectId: 'valineups-2024',
    storageBucket: 'valineups-2024.appspot.com',
    iosBundleId: 'com.example.valineups',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAnsLEtabcoPeybsgWEjg7q1o0WJpN0ujs',
    appId: '1:460791088203:ios:86344ce381470bee32b9ce',
    messagingSenderId: '460791088203',
    projectId: 'valineups-2024',
    storageBucket: 'valineups-2024.appspot.com',
    iosBundleId: 'com.example.valineups',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAiXEAOXrZX8_tms9bA3uSmTn5Ynb1waNU',
    appId: '1:460791088203:web:e05adb79f7ec1ac532b9ce',
    messagingSenderId: '460791088203',
    projectId: 'valineups-2024',
    authDomain: 'valineups-2024.firebaseapp.com',
    storageBucket: 'valineups-2024.appspot.com',
    measurementId: 'G-VMYQKX1B5D',
  );
}
