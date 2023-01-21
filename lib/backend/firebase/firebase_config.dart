import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAfgXy-exBoqCzkTuL8sdxnNpJ2AdHQd8Q",
            authDomain: "nexl-business-card.firebaseapp.com",
            projectId: "nexl-business-card",
            storageBucket: "nexl-business-card.appspot.com",
            messagingSenderId: "269857866646",
            appId: "1:269857866646:web:a0cf3fb990b737d44153b7",
            measurementId: "G-9S8KE404PB"));
  } else {
    await Firebase.initializeApp();
  }
}
