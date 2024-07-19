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
    apiKey: 'AIzaSyCiT2AiYbM_oV0cNnVXtOKk66tAwErZ6FI',
    appId: '1:604036820057:web:a641f58a35b859901ad548',
    messagingSenderId: '604036820057',
    projectId: 'recipes-app-7eeac',
    authDomain: 'recipes-app-7eeac.firebaseapp.com',
    storageBucket: 'recipes-app-7eeac.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAP-EQh5yReO8_d4hmGmUCrfBMDfk9ec7k',
    appId: '1:604036820057:android:6fba61558d91e7c81ad548',
    messagingSenderId: '604036820057',
    projectId: 'recipes-app-7eeac',
    storageBucket: 'recipes-app-7eeac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBix4NkidiXyGXinKWTpxpw_avDiyTZK6g',
    appId: '1:604036820057:ios:2619e295ae203cc31ad548',
    messagingSenderId: '604036820057',
    projectId: 'recipes-app-7eeac',
    storageBucket: 'recipes-app-7eeac.appspot.com',
    iosBundleId: 'com.example.recipesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBix4NkidiXyGXinKWTpxpw_avDiyTZK6g',
    appId: '1:604036820057:ios:185b3a53d61753bc1ad548',
    messagingSenderId: '604036820057',
    projectId: 'recipes-app-7eeac',
    storageBucket: 'recipes-app-7eeac.appspot.com',
    iosBundleId: 'com.example.recipesApp.RunnerTests',
  );
}