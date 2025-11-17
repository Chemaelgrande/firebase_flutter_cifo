import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_cifo/auth/data/models/auth_dto.dart';

class AuthFirebaseRepository {
  static Future<AuthDto?> signInAnonymously() async {
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance.signInAnonymously();

      AuthDto myAuth = AuthDto.fromFirebaseUser(userCredential);

      return myAuth;
    } catch (e) {
      return null;
    }
  }

  static Future<AuthDto?> logOut() async {
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance.signInAnonymously();

      AuthDto myAuth = AuthDto.fromFirebaseUser(userCredential);

      return myAuth;
    } catch (e) {
      return null;
    }
  }
}
