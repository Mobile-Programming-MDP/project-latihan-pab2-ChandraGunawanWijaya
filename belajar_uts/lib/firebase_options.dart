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
    apiKey: 'AIzaSyBdwrSB2MiE7WodB6QRNSLgmfBSlQbab44',
    appId: '1:370589648676:web:d54625046d9ea33fd255b1',
    messagingSenderId: '370589648676',
    projectId: 'belajar-uts',
    authDomain: 'belajar-uts.firebaseapp.com',
    storageBucket: 'belajar-uts.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAcSpqCFlrSF6_ErqAWD-pNK2qcdzLinB8',
    appId: '1:370589648676:android:c29aec3302a91dd4d255b1',
    messagingSenderId: '370589648676',
    projectId: 'belajar-uts',
    storageBucket: 'belajar-uts.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAOxLxqYbOVxMWuzW2KeccxKvVxG6zDjmA',
    appId: '1:370589648676:ios:083028195c476ddfd255b1',
    messagingSenderId: '370589648676',
    projectId: 'belajar-uts',
    storageBucket: 'belajar-uts.firebasestorage.app',
    iosBundleId: 'com.example.belajarUts',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAOxLxqYbOVxMWuzW2KeccxKvVxG6zDjmA',
    appId: '1:370589648676:ios:083028195c476ddfd255b1',
    messagingSenderId: '370589648676',
    projectId: 'belajar-uts',
    storageBucket: 'belajar-uts.firebasestorage.app',
    iosBundleId: 'com.example.belajarUts',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBdwrSB2MiE7WodB6QRNSLgmfBSlQbab44',
    appId: '1:370589648676:web:a9de9f4fd2ab255ad255b1',
    messagingSenderId: '370589648676',
    projectId: 'belajar-uts',
    authDomain: 'belajar-uts.firebaseapp.com',
    storageBucket: 'belajar-uts.firebasestorage.app',
  );
}
