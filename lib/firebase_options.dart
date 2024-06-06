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
    apiKey: 'AIzaSyDG44stMnlsm0n28EJUQQm52TU-j-TsLik',
    appId: '1:118176220640:web:cc870881364f4580771785',
    messagingSenderId: '118176220640',
    projectId: 'fileupload-7f9ad',
    authDomain: 'fileupload-7f9ad.firebaseapp.com',
    storageBucket: 'fileupload-7f9ad.appspot.com',
    measurementId: 'G-WTXN7MPF4D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSV_FNtngJp6Wo4EBfk642Djxs-fv5Sjc',
    appId: '1:118176220640:android:5d4684f95d4fccb4771785',
    messagingSenderId: '118176220640',
    projectId: 'fileupload-7f9ad',
    storageBucket: 'fileupload-7f9ad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGA8bIXvQoFrLH_5tgyBg6KR6Tww3DuO0',
    appId: '1:118176220640:ios:359e6baffc948124771785',
    messagingSenderId: '118176220640',
    projectId: 'fileupload-7f9ad',
    storageBucket: 'fileupload-7f9ad.appspot.com',
    iosBundleId: 'com.example.fileupload',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGA8bIXvQoFrLH_5tgyBg6KR6Tww3DuO0',
    appId: '1:118176220640:ios:359e6baffc948124771785',
    messagingSenderId: '118176220640',
    projectId: 'fileupload-7f9ad',
    storageBucket: 'fileupload-7f9ad.appspot.com',
    iosBundleId: 'com.example.fileupload',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDG44stMnlsm0n28EJUQQm52TU-j-TsLik',
    appId: '1:118176220640:web:3d5b3bed741eee68771785',
    messagingSenderId: '118176220640',
    projectId: 'fileupload-7f9ad',
    authDomain: 'fileupload-7f9ad.firebaseapp.com',
    storageBucket: 'fileupload-7f9ad.appspot.com',
    measurementId: 'G-L8054EV7P0',
  );
}
