import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class BeenieFirebaseUser {
  BeenieFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

BeenieFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<BeenieFirebaseUser> beenieFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<BeenieFirebaseUser>(
      (user) {
        currentUser = BeenieFirebaseUser(user);
        return currentUser!;
      },
    );
