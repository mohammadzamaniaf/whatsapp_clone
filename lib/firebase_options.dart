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
    apiKey: 'AIzaSyBi4WOm1JIsitx3jjL-UI3aJu-ua9DOZJg',
    appId: '1:1097575861697:web:612f505369b1353ab13340',
    messagingSenderId: '1097575861697',
    projectId: 'whatsapp-clone-628f8',
    authDomain: 'whatsapp-clone-628f8.firebaseapp.com',
    storageBucket: 'whatsapp-clone-628f8.appspot.com',
    measurementId: 'G-CNEZYMNEPE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDIEA9pEoVtogIqHuY5BtXEldGBU1cpCS4',
    appId: '1:1097575861697:android:49e983fee10f875eb13340',
    messagingSenderId: '1097575861697',
    projectId: 'whatsapp-clone-628f8',
    storageBucket: 'whatsapp-clone-628f8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4KLeLCzP72Hior4_BuW_-1fdKNcp9yJI',
    appId: '1:1097575861697:ios:165832c246f62ac3b13340',
    messagingSenderId: '1097575861697',
    projectId: 'whatsapp-clone-628f8',
    storageBucket: 'whatsapp-clone-628f8.appspot.com',
    iosClientId: '1097575861697-jtuomgsavulihmk13kk7agcfmm4ikhit.apps.googleusercontent.com',
    iosBundleId: 'com.topdevelopers.whatsappClone',
  );
}
