import 'package:bank_app/core/errors/error_mapper.dart';
import 'package:bank_app/core/errors/failures.dart';
import 'package:bank_app/core/logging/app_logger.dart';
import 'package:bank_app/core/users/data/data_sources/firestore_users_data_source.dart';
import 'package:bank_app/core/users/domain/entities/user.dart';
import 'package:bank_app/features/auth/data/data_sources/firebase_authentication_data_source.dart';
import 'package:bank_app/features/auth/data/models/user_password_model.dart';
import 'package:bank_app/features/auth/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required FirebaseAuthenticationDataSource firebaseAuthenticationDataSource,
    required FirestoreUsersDataSource firestoreUsersDataSource,
  }) : _firebaseAuthenticationDataSource = firebaseAuthenticationDataSource,
       _firestoreUsersDataSource = firestoreUsersDataSource;

  final FirebaseAuthenticationDataSource _firebaseAuthenticationDataSource;
  final FirestoreUsersDataSource _firestoreUsersDataSource;

  @override
  Future<String> getAccessToken() async {
    final token = await _firebaseAuthenticationDataSource.getSessionToken();
    if (token == null) {
      throw const AuthFailure('No hay una sesión activa.');
    }
    return token;
  }

  @override
  Future<bool> isSignedIn() async {
    final sessionToken = await _firebaseAuthenticationDataSource
        .getSessionToken();
    return sessionToken != null;
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final authModel = await _firebaseAuthenticationDataSource.login(
      UserPasswordModel(email: email, password: password),
    );
    try {
      final user = await _firestoreUsersDataSource.getUser(authModel.id);
      return User.fromModel(user);
    } catch (e) {
      // Decisión temporal: si el perfil no se puede leer (p. ej. reglas de
      // Firestore), se permite el acceso con los datos de Firebase Auth.
      // Ver specs/001-autenticacion (T4): debe pasar a un Failure visible.
      AppLogger.warning(
        'Perfil no disponible, se usa el de Firebase Auth '
        '(${mapToFailure(e).runtimeType})',
      );
      return User(email: authModel.email, name: authModel.username);
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuthenticationDataSource.logout();
  }
}
