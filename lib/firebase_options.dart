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
    apiKey: 'AIzaSyDkaECJbjzTSeXZfMKbslloFTJpyNTvVM0',
    appId: '1:1062773916324:web:ff3f48a2177dc7e95d9c31',
    messagingSenderId: '1062773916324',
    projectId: 'ants-a11a7',
    authDomain: 'ants-a11a7.firebaseapp.com',
    storageBucket: 'ants-a11a7.appspot.com',
    measurementId: 'G-T8TMCLW3J0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRd1i6-rD0sn8ztugVYRx7m_4QPucamEs',
    appId: '1:1062773916324:android:7b4da3197819cc325d9c31',
    messagingSenderId: '1062773916324',
    projectId: 'ants-a11a7',
    storageBucket: 'ants-a11a7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAM701DSgaNXCKMCRo_Z5JweuRmnh6klpA',
    appId: '1:1062773916324:ios:c84cde34244737325d9c31',
    messagingSenderId: '1062773916324',
    projectId: 'ants-a11a7',
    storageBucket: 'ants-a11a7.appspot.com',
    iosBundleId: 'com.example.ants',
  );
}