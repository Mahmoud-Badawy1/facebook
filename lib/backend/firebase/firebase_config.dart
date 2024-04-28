import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDkrlpUWXMpwALNWM4J2Y8byH1OxOBsZbs",
            authDomain: "facebook-74.firebaseapp.com",
            projectId: "facebook-74",
            storageBucket: "facebook-74.appspot.com",
            messagingSenderId: "659600372970",
            appId: "1:659600372970:web:094caa30528594e923d393"));
  } else {
    await Firebase.initializeApp();
  }
}
