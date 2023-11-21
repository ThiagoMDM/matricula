import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBuyYEtdN1ieYg6kcPwmOE2CYwTg7L2NxI",
            authDomain: "performance-2560b.firebaseapp.com",
            projectId: "performance-2560b",
            storageBucket: "performance-2560b.appspot.com",
            messagingSenderId: "48294935791",
            appId: "1:48294935791:web:3586386d983c1b020baf1a",
            measurementId: "G-GGRW73EVVF"));
  } else {
    await Firebase.initializeApp();
  }
}
