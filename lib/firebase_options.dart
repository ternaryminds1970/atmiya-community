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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDLVMeEOTOXH3syGqXorfKd5YOO3bE30vQ',
    appId: '1:509843134707:web:c95838448494352e00bf86',
    messagingSenderId: '509843134707',
    projectId: 'atmiya-community',
    authDomain: 'atmiya-community.firebaseapp.com',
    storageBucket: 'atmiya-community.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCGv4Ppiv9-YIPpK9hp1UC63n3wd1_lMrg',
    appId: '1:509843134707:android:7ffc8ec2c6d5129600bf86',
    messagingSenderId: '509843134707',
    projectId: 'atmiya-community',
    storageBucket: 'atmiya-community.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBRqehThU71pccC7GIJAWMmz42-RVmakaI',
    appId: '1:509843134707:ios:b9cf64ecb6fe9afe00bf86',
    messagingSenderId: '509843134707',
    projectId: 'atmiya-community',
    storageBucket: 'atmiya-community.appspot.com',
    iosBundleId: 'com.ternaryminds.atmiyaCommunity',
  );
}
