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
    apiKey: 'AIzaSyDq_8Qq_AIZ19GXPb0ifdWFKza1rOEXTIw',
    appId: '1:78869228697:web:724c218788ce0996b81c08',
    messagingSenderId: '78869228697',
    projectId: 'lasuchtl-8f85b',
    authDomain: 'lasuchtl-8f85b.firebaseapp.com',
    storageBucket: 'lasuchtl-8f85b.appspot.com',
    measurementId: 'G-5YCLW2H5P7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8V38ZDiJDdj6GctK9TZOjcY-cKQ2oW4w',
    appId: '1:78869228697:android:a08e96905bc9cdc3b81c08',
    messagingSenderId: '78869228697',
    projectId: 'lasuchtl-8f85b',
    storageBucket: 'lasuchtl-8f85b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDIFPMnIWl6BMLGpmfXNBPIFBt_WZFU_l8',
    appId: '1:78869228697:ios:e6c3f6a337852b41b81c08',
    messagingSenderId: '78869228697',
    projectId: 'lasuchtl-8f85b',
    storageBucket: 'lasuchtl-8f85b.appspot.com',
    iosBundleId: 'com.example.blocAuthFlow',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDIFPMnIWl6BMLGpmfXNBPIFBt_WZFU_l8',
    appId: '1:78869228697:ios:164391ca1db644d7b81c08',
    messagingSenderId: '78869228697',
    projectId: 'lasuchtl-8f85b',
    storageBucket: 'lasuchtl-8f85b.appspot.com',
    iosBundleId: 'com.example.blocAuthFlow.RunnerTests',
  );
}
