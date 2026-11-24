import 'package:bank_app/core/errors/failures.dart';
import 'package:bank_app/core/users/data/data_sources/firestore_users_data_source.dart';
import 'package:bank_app/core/users/data/models/user_model.dart';
import 'package:bank_app/features/auth/data/data_sources/firebase_authentication_data_source.dart';
import 'package:bank_app/features/auth/data/models/auth_model.dart';
import 'package:bank_app/features/auth/data/models/user_password_model.dart';
import 'package:bank_app/features/auth/data/repositories/authentication_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthDataSource extends Mock
    implements FirebaseAuthenticationDataSource {}

class MockUsersDataSource extends Mock implements FirestoreUsersDataSource {}

void main() {
  late MockAuthDataSource authDataSource;
  late MockUsersDataSource usersDataSource;
  late AuthenticationRepositoryImpl repository;

  const credentials = UserPasswordModel(email: 'ana@bank.com', password: 'x1y2z3');
  final authModel = AuthModel(id: 'uid-1', email: 'ana@bank.com', username: 'Ana');

  setUp(() {
    authDataSource = MockAuthDataSource();
    usersDataSource = MockUsersDataSource();
    repository = AuthenticationRepositoryImpl(
      firebaseAuthenticationDataSource: authDataSource,
      firestoreUsersDataSource: usersDataSource,
    );
  });

  test('login + perfil de Firestore -> User completo', () async {
    when(() => authDataSource.login(credentials)).thenAnswer((_) async => authModel);
    when(() => usersDataSource.getUser('ana@bank.com')).thenAnswer(
      (_) async => const UserModel(
        username: 'ana',
        email: 'ana@bank.com',
        firstName: 'Ana',
        lastName: 'López',
        gender: 'female',
        image: null,
        accessToken: null,
        newId: null,
      ),
    );

    final user = await repository.signInWithEmailAndPassword('ana@bank.com', 'x1y2z3');

    expect(user.fullName, 'Ana López');
    expect(user.gender, 'female');
  });

  test('si el perfil falla, entra con los datos de Firebase Auth', () async {
    when(() => authDataSource.login(credentials)).thenAnswer((_) async => authModel);
    when(
      () => usersDataSource.getUser(any()),
    ).thenThrow(const PermissionFailure('denied'));

    final user = await repository.signInWithEmailAndPassword('ana@bank.com', 'x1y2z3');

    expect(user.email, 'ana@bank.com');
    expect(user.name, 'Ana');
  });

  test('si el login falla, propaga el AuthFailure', () async {
    when(
      () => authDataSource.login(credentials),
    ).thenThrow(const AuthFailure('Incorrect password', code: 'wrong-password'));

    await expectLater(
      () => repository.signInWithEmailAndPassword('ana@bank.com', 'x1y2z3'),
      throwsA(isA<AuthFailure>()),
    );
    verifyNever(() => usersDataSource.getUser(any()));
  });

  test('isSignedIn es true solo si hay token de sesión', () async {
    when(() => authDataSource.getSessionToken()).thenAnswer((_) async => 'tok');
    expect(await repository.isSignedIn(), isTrue);

    when(() => authDataSource.getSessionToken()).thenAnswer((_) async => null);
    expect(await repository.isSignedIn(), isFalse);
  });

  test('getAccessToken sin sesión -> AuthFailure', () async {
    when(() => authDataSource.getSessionToken()).thenAnswer((_) async => null);

    await expectLater(
      () => repository.getAccessToken(),
      throwsA(isA<AuthFailure>()),
    );
  });
}
