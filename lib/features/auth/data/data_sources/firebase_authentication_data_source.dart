import 'package:bank_app/core/errors/error_mapper.dart';
import 'package:bank_app/core/errors/failures.dart';
import 'package:bank_app/core/logging/app_logger.dart';
import 'package:bank_app/core/users/data/models/user_model.dart';
import 'package:bank_app/features/auth/data/models/auth_model.dart';
import 'package:bank_app/features/auth/data/models/user_password_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationDataSource {
  FirebaseAuthenticationDataSource({required FirebaseAuth firebaseAuth})
    : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  Future<AuthModel> login(UserPasswordModel userPassword) async {
    try {
      // Seguridad: jamás se registran email/contraseña en logs.
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: userPassword.email,
        password: userPassword.password,
      );
      final user = credential.user;
      if (user == null) {
        throw const AuthFailure('Login failed: User is null');
      }
      return AuthModel(
        id: user.uid,
        email: userPassword.email,
        username: user.displayName ?? '',
      );
    } catch (e, st) {
      final failure = mapToFailure(e, context: 'iniciar sesión');
      AppLogger.warning(
        'Login fallido (${failure.runtimeType}'
        '${failure is AuthFailure ? ', code: ${failure.code}' : ''})',
      );
      AppLogger.error('Detalle técnico del login', null, st);
      throw failure;
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw mapToFailure(e, context: 'cerrar sesión');
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
    } catch (e) {
      throw mapToFailure(e, context: 'registrar usuario');
    }
  }

  Future<String?> getSessionToken() async {
    try {
      return await _firebaseAuth.currentUser?.getIdToken();
    } catch (e) {
      throw mapToFailure(e, context: 'obtener el token de sesión');
    }
  }
}
