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
    apiKey: 'AIzaSyBnl4FBGt666SwA5eKZIPy9hDS3FmEx8WI',
    appId: '1:446735603544:web:a10ca29e04de0cdfb2f72d',
    messagingSenderId: '446735603544',
    projectId: 'act-hub-3ce38',
    authDomain: 'act-hub-3ce38.firebaseapp.com',
    storageBucket: 'act-hub-3ce38.appspot.com',
    measurementId: 'G-DKZJ61Q90T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCblpeFZpPv65xhmhD2d4g5-xmyCI2dxVs',
    appId: '1:446735603544:android:4603d81aeb313375b2f72d',
    messagingSenderId: '446735603544',
    projectId: 'act-hub-3ce38',
    storageBucket: 'act-hub-3ce38.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDx8gBizw-_x7LAZ_rWxqnztOHZrkE4tRM',
    appId: '1:446735603544:ios:abdbc4b0a3b567f3b2f72d',
    messagingSenderId: '446735603544',
    projectId: 'act-hub-3ce38',
    storageBucket: 'act-hub-3ce38.appspot.com',
    iosClientId: '446735603544-2g6s5g59vju5bj2fj6mcjmai60g75424.apps.googleusercontent.com',
    iosBundleId: 'com.example.actHubProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDx8gBizw-_x7LAZ_rWxqnztOHZrkE4tRM',
    appId: '1:446735603544:ios:e05eb4f65048e382b2f72d',
    messagingSenderId: '446735603544',
    projectId: 'act-hub-3ce38',
    storageBucket: 'act-hub-3ce38.appspot.com',
    iosClientId: '446735603544-e16ivlkbsapd8s0d8uop27u710nf16q4.apps.googleusercontent.com',
    iosBundleId: 'com.example.actHubProject.RunnerTests',
  );
}