import 'package:bank_app/core/errors/app_errors.dart';
import 'package:bank_app/features/auth/data/data_sources/firebase_authentication_data_source.dart';
import 'package:bank_app/features/auth/data/data_sources/firestore_users_data_source.dart';
import 'package:bank_app/features/auth/data/models/user_password_model.dart';
import 'package:bank_app/features/auth/domain/entities/user.dart';
import 'package:bank_app/features/auth/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl({
    FirebaseAuthenticationDataSource? firebaseAuthenticationDataSource,
    FirestoreUsersDataSource? firestoreUsersDataSource,
  }) : _firebaseAuthenticationDataSource =
           firebaseAuthenticationDataSource ??
           FirebaseAuthenticationDataSource(),
       _firestoreUsersDataSource =
           firestoreUsersDataSource ?? FirestoreUsersDataSource();

  final FirebaseAuthenticationDataSource _firebaseAuthenticationDataSource;
  final FirestoreUsersDataSource _firestoreUsersDataSource;

  @override
  Future<String> getAccessToken() {
    throw UnimplementedError();
  }

  @override
  Future<String> getUserEmail() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignedIn() async {
    //await _localAuthenticationDataSource.getSessionToken();
    final sessionToken = await _firebaseAuthenticationDataSource
        .getSessionToken();
    return sessionToken != null;
  }

  @override
  Future<bool> logOut() async {
    try {
      await _firebaseAuthenticationDataSource.logout();
      return true;
    } catch (e) {
      throw Exception('${AppErrors.authException}: $e');
    }
  }

  @override
  Future<bool> registerWithEmailAndPassword(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final UserPasswordModel userPasswordModel = UserPasswordModel(
      email: email,
      password: password,
    );

    final authModel = await _firebaseAuthenticationDataSource.login(
      userPasswordModel,
    );
    final user = await _firestoreUsersDataSource.getUser(authModel.email);
    return User.fromModel(user);
  }

  @override
  Future<void> signInWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuthenticationDataSource.logout();
  }

  @override
  Future<void> saveSession(String token) async {
    throw UnimplementedError();
  }
}
