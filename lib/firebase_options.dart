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
    apiKey: 'AIzaSyD28vF2nMYTtNy3J692d8tFluoplOmU4pM',
    appId: '1:502143694517:web:242d4e5512c431b47ab0fc',
    messagingSenderId: '502143694517',
    projectId: 'auth-80b70',
    authDomain: 'auth-80b70.firebaseapp.com',
    storageBucket: 'auth-80b70.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMwVa7hnSFIDeJXN-_LHjGrUTbU8u9t0o',
    appId: '1:502143694517:android:e9afbd1b232d18647ab0fc',
    messagingSenderId: '502143694517',
    projectId: 'auth-80b70',
    storageBucket: 'auth-80b70.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYV3XBK4DqbD770zQnaz7OQ5sDFQDdyis',
    appId: '1:502143694517:ios:e5d1955c49f5f67c7ab0fc',
    messagingSenderId: '502143694517',
    projectId: 'auth-80b70',
    storageBucket: 'auth-80b70.appspot.com',
    iosClientId: '502143694517-nu2h26ubg4to0ar33ubh4v1ajge9s0o7.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginVanguard',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCYV3XBK4DqbD770zQnaz7OQ5sDFQDdyis',
    appId: '1:502143694517:ios:e5d1955c49f5f67c7ab0fc',
    messagingSenderId: '502143694517',
    projectId: 'auth-80b70',
    storageBucket: 'auth-80b70.appspot.com',
    iosClientId: '502143694517-nu2h26ubg4to0ar33ubh4v1ajge9s0o7.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginVanguard',
  );
}
