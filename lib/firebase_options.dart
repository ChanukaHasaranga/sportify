// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart'
 show FirebaseOptions;
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
    apiKey: 'AIzaSyBxEIjEs21ciiZOMD4cF-326vAzToc5zcM',
    appId: '1:1072362184260:web:7246aad7bb7ad5c4c7a611',
    messagingSenderId: '1072362184260',
    projectId: 'spotify-217da',
    authDomain: 'spotify-217da.firebaseapp.com',
    storageBucket: 'spotify-217da.appspot.com',
    measurementId: 'G-WR10ETBBD0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDK8YMfsP7gXHU1PPCqBaqMPMfwcScaV0',
    appId: '1:1072362184260:android:86683a2732b0c02ac7a611',
    messagingSenderId: '1072362184260',
    projectId: 'spotify-217da',
    storageBucket: 'spotify-217da.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCt48om6pjb9J1XYyvg3tjAEOt_6B4nJ4E',
    appId: '1:1072362184260:ios:d5e69e1a0880938bc7a611',
    messagingSenderId: '1072362184260',
    projectId: 'spotify-217da',
    storageBucket: 'spotify-217da.appspot.com',
    iosBundleId: 'com.example.sportify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCt48om6pjb9J1XYyvg3tjAEOt_6B4nJ4E',
    appId: '1:1072362184260:ios:d7352f024bba4a34c7a611',
    messagingSenderId: '1072362184260',
    projectId: 'spotify-217da',
    storageBucket: 'spotify-217da.appspot.com',
    iosBundleId: 'com.example.sportify.RunnerTests',
  );
}
