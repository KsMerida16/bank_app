import 'package:bank_app/features/auth/data/data/data_sources/local_authentication_data_source.dart';
import 'package:bank_app/features/auth/data/data/data_sources/remote_authentication_data_source.dart';
import 'package:bank_app/features/auth/data/data/models/user_password_model.dart';
import 'package:bank_app/features/auth/domain/entities/user.dart';
import 'package:bank_app/features/auth/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl({
    RemoteAutheticationDataSource? remoteAutheticationDataSource,
    LocalAuthenticationDataSource? localAuthenticationDataSource,
  }) : _remoteAutheticationDataSource =
           remoteAutheticationDataSource ?? RemoteAutheticationDataSource(),
       _localAuthenticationDataSource =
           localAuthenticationDataSource ?? LocalAuthenticationDataSource();
  final RemoteAutheticationDataSource _remoteAutheticationDataSource;
  final LocalAuthenticationDataSource _localAuthenticationDataSource;

  @override
  Future<String> getAccessToken() {
    // TODO: implement getAccessToken
    throw UnimplementedError();
  }

  @override
  Future<String> getUserEmail() {
    // TODO: implement getUserEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignedIn() async {
    final sessionToken = await _localAuthenticationDataSource.getSessionToken();
    return sessionToken != null;
  }

  @override
  Future<bool> logOut() async {
    await _localAuthenticationDataSource.clearSession();

    return true;
  }

  @override
  Future<bool> registerWithEmailAndPassword(String email, String password) {
    // TODO: implement registerWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<User> signIUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final UserPasswordModel userPasswordModel = UserPasswordModel(
      email: email,
      password: password,
    );

    final userModel = await _remoteAutheticationDataSource
        .signIUpWithEmailAndPassword(userPasswordModel);

    return User.fromModel(userModel);
  }

  @override
  Future<void> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> saveSession(String token) async {
    await _localAuthenticationDataSource.saveSession(token);
  }
}
