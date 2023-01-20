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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMagC9l5JIuP3QIKZQ1-Leb_tKTwcs1No',
    appId: '1:1087083613741:android:ef42110a6ec70be4d6b2a4',
    messagingSenderId: '1087083613741',
    projectId: 'flutter-firebase-a2d66',
    storageBucket: 'flutter-firebase-a2d66.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPnZ9CeazX9DTojA7rTyEfSFQqV6SKkcI',
    appId: '1:1087083613741:ios:8f2ccde914acecbfd6b2a4',
    messagingSenderId: '1087083613741',
    projectId: 'flutter-firebase-a2d66',
    storageBucket: 'flutter-firebase-a2d66.appspot.com',
    androidClientId: '1087083613741-86e8rs6rg9lhcmtguqaj3n7qf4bok41r.apps.googleusercontent.com',
    iosClientId: '1087083613741-edq80i3a27se4lcbaqrirqouddar5s9k.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirebaseTestApp',
  );
}
