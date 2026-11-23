import 'package:bank_app/core/logging/app_logger.dart';
import 'package:bank_app/core/users/data/models/user_model.dart';
import 'package:bank_app/features/auth/data/models/auth_model.dart';
import 'package:bank_app/features/auth/data/models/user_password_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationDataSource {
  FirebaseAuthenticationDataSource({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  Future<AuthModel> login(UserPasswordModel userPassword) async {
    try {
      // Seguridad: jamás se registran email/contraseña en logs.
      final login = await _firebaseAuth.signInWithEmailAndPassword(
        email: userPassword.email,
        password: userPassword.password,
      );
      final user = login.user;
      if (user == null) {
        throw Exception('Login failed: User is null');
      }
      return AuthModel(
        id: user.uid,
        email: userPassword.email,
        username: user.displayName ?? '',
      );
    } on FirebaseAuthException catch (e) {
      AppLogger.warning('Login rechazado por Firebase Auth (code: ${e.code})');
      throw Exception(_loginMessage(e));
    } catch (e, st) {
      AppLogger.error('Error inesperado en login', e, st);
      throw Exception('Unknown error: $e');
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e, st) {
      AppLogger.error('Error al cerrar sesión', e, st);
      throw Exception('Error al cerrar sesión: $e');
    }
  }

  Future<bool> isLoggedIn() async => _firebaseAuth.currentUser != null;

  Future<UserModel> register(String email, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return UserModel(
        email: email,
        username: credential.user?.displayName ?? '',
        firstName: '',
        lastName: '',
        gender: '',
        image: '',
        accessToken: '',
        newId: '',
      );
    } on FirebaseAuthException catch (e) {
      AppLogger.warning('Registro rechazado por Firebase Auth (code: ${e.code})');
      throw Exception(_registerMessage(e));
    } catch (e, st) {
      AppLogger.error('Error inesperado en registro', e, st);
      throw Exception('Unknown error: $e');
    }
  }

  Future<String?> getSessionToken() async {
    try {
      return await _firebaseAuth.currentUser?.getIdToken();
    } catch (e, st) {
      AppLogger.error('Error al obtener el token de sesión', e, st);
      throw Exception('Error al obtener el token de sesión: $e');
    }
  }

  String _loginMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'User not found. Please register first.';
      case 'wrong-password':
        return 'Incorrect password';
      case 'invalid-email':
        return 'Invalid email format';
      case 'invalid-credential':
        return 'Invalid email or password. Please try again.';
      default:
        return e.message ?? 'Login failed';
    }
  }

  String _registerMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'This email is already registered';
      case 'weak-password':
        return 'Password must be at least 6 characters';
      case 'invalid-email':
        return 'Invalid email format';
      default:
        return e.message ?? 'Registration failed';
    }
  }
}
