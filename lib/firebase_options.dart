import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return android;
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAsuFCqa0CUJTuvAMEqoVvLqmBAGeUA_0',
    appId: '1:231337916164:android:46e36abc00f1c4d5338251',
    messagingSenderId: '231337916164',
    projectId: 'food-delivery-af1be',
    storageBucket: 'food-delivery-af1be.appspot.com',
  );
}
