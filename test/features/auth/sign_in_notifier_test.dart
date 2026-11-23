import 'package:bank_app/core/users/domain/entities/user.dart';
import 'package:bank_app/features/auth/domain/repositories/authentication_repository.dart';
import 'package:bank_app/features/auth/domain/use_cases/signed_in_use_case.dart';
import 'package:bank_app/features/auth/domain/use_cases/sing_in_use_case.dart';
import 'package:bank_app/features/auth/presentation/state/sign_in_notifier.dart';
import 'package:bank_app/features/auth/presentation/state/sign_in_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late MockAuthenticationRepository repository;
  late SignInNotifier notifier;

  setUp(() {
    repository = MockAuthenticationRepository();
    notifier = SignInNotifier(
      signInUseCase: SignInUseCase(authenticationRepository: repository),
      signedInUseCase: SignedInUseCase(authenticationRepository: repository),
    );
  });

  group('SignInNotifier.login', () {
    test('estado inicial es SignInInitialState y no logueado', () {
      expect(notifier.state, isA<SignInInitialState>());
      expect(notifier.state.logged, isFalse);
    });

    test('con credenciales válidas pasa a SignInSuccessState', () async {
      when(
        () => repository.signInWithEmailAndPassword('ana@bank.com', 'secret1'),
      ).thenAnswer(
        (_) async => const User(
          email: 'ana@bank.com',
          name: 'Ana',
          surname: 'López',
          gender: 'female',
        ),
      );

      final ok = await notifier.login('ana@bank.com', 'secret1');

      expect(ok, isTrue);
      expect(notifier.state, isA<SignInSuccessState>());
      final state = notifier.state as SignInSuccessState;
      expect(state.userName, 'Ana López');
      expect(state.userGender, 'female');
      expect(state.logged, isTrue);
    });

    test('si el repositorio falla pasa a SignInErrorState', () async {
      when(
        () => repository.signInWithEmailAndPassword(any(), any()),
      ).thenThrow(Exception('Invalid email or password'));

      final ok = await notifier.login('ana@bank.com', 'mala');

      expect(ok, isFalse);
      expect(notifier.state, isA<SignInErrorState>());
      expect(notifier.state.logged, isFalse);
      expect(
        (notifier.state as SignInErrorState).errorMessage,
        contains('Invalid email or password'),
      );
    });
  });

  group('SignInNotifier.checkIfLogged', () {
    test('sesión activa -> SignInSuccessState', () async {
      when(() => repository.isSignedIn()).thenAnswer((_) async => true);

      await notifier.checkIfLogged();

      expect(notifier.state, isA<SignInSuccessState>());
    });

    test('sin sesión -> SignInInitialState', () async {
      when(() => repository.isSignedIn()).thenAnswer((_) async => false);

      await notifier.checkIfLogged();

      expect(notifier.state, isA<SignInInitialState>());
    });
  });

  test('signOut regresa al estado inicial', () async {
    when(
      () => repository.signInWithEmailAndPassword(any(), any()),
    ).thenAnswer((_) async => const User(email: 'a@b.com', name: 'A'));
    await notifier.login('a@b.com', 'x');

    notifier.signOut();

    expect(notifier.state, isA<SignInInitialState>());
  });
}
