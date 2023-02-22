// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
/// test
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
    apiKey: 'AIzaSyDpZlgsrcBARCsY0SX2v3YTgFF5IcwmMW0',
    appId: '1:896145225303:web:c90486f8442cba0be21512',
    messagingSenderId: '896145225303',
    projectId: 'copyui-82583',
    authDomain: 'copyui-82583.firebaseapp.com',
    databaseURL: 'https://copyui-82583-default-rtdb.firebaseio.com',
    storageBucket: 'copyui-82583.appspot.com',
    measurementId: 'G-ZPWYVX732L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrtnRgU0BSmCYzJXgkzbwk48zCzdEsTus',
    appId: '1:896145225303:android:ccd3752524c73d26e21512',
    messagingSenderId: '896145225303',
    projectId: 'copyui-82583',
    databaseURL: 'https://copyui-82583-default-rtdb.firebaseio.com',
    storageBucket: 'copyui-82583.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADQXSnoG9_mgHeBF5v9FBFgd9SmrLYGi8',
    appId: '1:896145225303:ios:3022715b15d1a5bfe21512',
    messagingSenderId: '896145225303',
    projectId: 'copyui-82583',
    databaseURL: 'https://copyui-82583-default-rtdb.firebaseio.com',
    storageBucket: 'copyui-82583.appspot.com',
    iosClientId:
        '896145225303-1pqjeqp3n1f9ufiupn423ogdlqa0l3m5.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatai',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADQXSnoG9_mgHeBF5v9FBFgd9SmrLYGi8',
    appId: '1:896145225303:ios:3022715b15d1a5bfe21512',
    messagingSenderId: '896145225303',
    projectId: 'copyui-82583',
    databaseURL: 'https://copyui-82583-default-rtdb.firebaseio.com',
    storageBucket: 'copyui-82583.appspot.com',
    iosClientId:
        '896145225303-1pqjeqp3n1f9ufiupn423ogdlqa0l3m5.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatai',
  );
}
