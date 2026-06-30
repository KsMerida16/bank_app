import 'package:bank_app/features/auth/domain/entities/user.dart';

abstract class AuthenticationRepository {
  Future<void> signInWithGoogle();
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String> getUserEmail();
  Future<bool> logOut();
  Future<bool> registerWithEmailAndPassword(String email, String password);
  Future<String> getAccessToken();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<void> saveSession(String token);
}
