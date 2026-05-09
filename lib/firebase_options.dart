// Synced with Firebase project quiz-1e9a4. Refresh with `flutterfire configure` if you add apps.
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        return ios;
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        return android;
      case TargetPlatform.fuchsia:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for Fuchsia.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD-2Vw9anLjJeixIa7KVV7HnOv3HN18L3E',
    appId: '1:53641696129:web:24010e6e1ee5ab896a4e80',
    messagingSenderId: '53641696129',
    projectId: 'quiz-1e9a4',
    authDomain: 'quiz-1e9a4.firebaseapp.com',
    storageBucket: 'quiz-1e9a4.firebasestorage.app',
    measurementId: 'G-56ERQ7DR9F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2RX3mE_vsDgYxZc-_47cNmkcoGgpfoaE',
    appId: '1:53641696129:android:1c52dcbd4e1637056a4e80',
    messagingSenderId: '53641696129',
    projectId: 'quiz-1e9a4',
    storageBucket: 'quiz-1e9a4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBoNEbfGX0f_meecT1dQgS3JP5JOjE-SFo',
    appId: '1:53641696129:ios:e7a35aaad69e14b56a4e80',
    messagingSenderId: '53641696129',
    projectId: 'quiz-1e9a4',
    storageBucket: 'quiz-1e9a4.firebasestorage.app',
    iosBundleId: 'com.example.login',
  );
}
