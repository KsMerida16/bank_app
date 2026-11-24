# Plan — Autenticación

- `FirebaseAuthenticationDataSource` (data): envuelve `FirebaseAuth`, traduce códigos a mensajes.
- `AuthenticationRepositoryImpl` (data) implementa `AuthenticationRepository` (domain).
- Use cases: `SignInUseCase`, `SignedInUseCase`, `SignOutUseCase`.
- `SignInNotifier` (presentation) expone `SignInState` (initial/loading/success/error).
- `goRouterProvider` observa `signInRiverpodProvider.logged` para proteger rutas.

## Decisiones
- Riverpod por testabilidad y desacople de la UI.
- Firebase Auth en lugar de JWT propio: delega almacenamiento seguro del token y refresco.

## Pruebas
`test/features/auth/sign_in_notifier_test.dart` (mocktail sobre `AuthenticationRepository`).
