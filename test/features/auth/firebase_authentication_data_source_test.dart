import 'package:bank_app/core/errors/failures.dart';
import 'package:bank_app/features/auth/data/data_sources/firebase_authentication_data_source.dart';
import 'package:bank_app/features/auth/data/models/user_password_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements fb.FirebaseAuth {}

class MockUserCredential extends Mock implements fb.UserCredential {}

class MockFirebaseUser extends Mock implements fb.User {}

void main() {
  late MockFirebaseAuth auth;
  late FirebaseAuthenticationDataSource dataSource;

  const credentials = UserPasswordModel(email: 'ana@bank.com', password: 'secret1');

  setUp(() {
    auth = MockFirebaseAuth();
    dataSource = FirebaseAuthenticationDataSource(firebaseAuth: auth);
  });

  void stubSignIn() => when(
    () => auth.signInWithEmailAndPassword(
      email: any(named: 'email'),
      password: any(named: 'password'),
    ),
  );

  test('login exitoso devuelve AuthModel con uid y correo', () async {
    final user = MockFirebaseUser();
    final credential = MockUserCredential();
    when(() => user.uid).thenReturn('uid-1');
    when(() => user.displayName).thenReturn('Ana');
    when(() => credential.user).thenReturn(user);
    stubSignIn().thenAnswer((_) async => credential);

    final model = await dataSource.login(credentials);

    expect(model.id, 'uid-1');
    expect(model.email, 'ana@bank.com');
    expect(model.username, 'Ana');
  });

  test('credenciales inválidas -> AuthFailure con mensaje amigable', () async {
    stubSignIn().thenThrow(fb.FirebaseAuthException(code: 'invalid-credential'));

    await expectLater(
      dataSource.login(credentials),
      throwsA(
        isA<AuthFailure>().having(
          (f) => f.message,
          'message',
          contains('Invalid email or password'),
        ),
      ),
    );
  });

  test('el mensaje del error nunca contiene la contraseña', () async {
    stubSignIn().thenThrow(fb.FirebaseAuthException(code: 'wrong-password'));

    try {
      await dataSource.login(credentials);
      fail('se esperaba un AuthFailure');
    } on AuthFailure catch (failure) {
      expect(failure.message, isNot(contains('secret1')));
      expect(failure.toString(), isNot(contains('secret1')));
    }
  });

  test('isLoggedIn depende de currentUser', () async {
    when(() => auth.currentUser).thenReturn(null);
    expect(await dataSource.isLoggedIn(), isFalse);

    when(() => auth.currentUser).thenReturn(MockFirebaseUser());
    expect(await dataSource.isLoggedIn(), isTrue);
  });
}
