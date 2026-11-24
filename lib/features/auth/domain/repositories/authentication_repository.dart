import 'package:bank_app/core/users/domain/entities/user.dart';

abstract class AuthenticationRepository {
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String> getAccessToken();
}
