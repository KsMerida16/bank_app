import 'package:bank_app/core/di/core_providers.dart';
import 'package:bank_app/core/users/domain/entities/user.dart';
import 'package:bank_app/features/auth/di/auth_providers.dart';
import 'package:bank_app/features/auth/domain/repositories/authentication_repository.dart';
import 'package:bank_app/features/auth/presentation/state/sign_in_notifier.dart';
import 'package:bank_app/features/auth/presentation/state/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  test('el grafo de dependencias se puede sobreescribir sin Firebase', () async {
    final repository = MockAuthenticationRepository();
    when(
      () => repository.signInWithEmailAndPassword('a@b.com', 'pw'),
    ).thenAnswer((_) async => const User(email: 'a@b.com', name: 'Ana'));

    final container = ProviderContainer(
      overrides: [authenticationRepositoryProvider.overrideWithValue(repository)],
    );
    addTearDown(container.dispose);

    final ok = await container
        .read(signInRiverpodProvider.notifier)
        .login('a@b.com', 'pw');

    expect(ok, isTrue);
    expect(container.read(signInRiverpodProvider), isA<SignInSuccessState>());
    verify(() => repository.signInWithEmailAndPassword('a@b.com', 'pw')).called(1);
  });

  test('los providers de infraestructura son los únicos que tocan Firebase', () {
    // Sin Firebase.initializeApp, leer los use cases solo con overrides
    // no debe instanciar FirebaseAuth/Firestore.
    final container = ProviderContainer(
      overrides: [
        authenticationRepositoryProvider.overrideWithValue(
          MockAuthenticationRepository(),
        ),
      ],
    );
    addTearDown(container.dispose);

    expect(() => container.read(signInUseCaseProvider), returnsNormally);
    expect(() => container.read(signedInUseCaseProvider), returnsNormally);
    expect(() => container.read(signOutUseCaseProvider), returnsNormally);
    // firebaseAuthProvider / firestoreProvider existen como puntos de inyección.
    expect(firebaseAuthProvider, isNotNull);
    expect(firestoreProvider, isNotNull);
  });
}
