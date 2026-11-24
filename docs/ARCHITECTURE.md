# Arquitectura

```
lib/
├── core/            # transversal: errores, red, logging, navegación, entornos, notificaciones
│   ├── accounts/ users/ catalogs/   # dominios compartidos (data/domain)
├── features/
│   ├── auth/  dashboard/  notifications/  settings/  history/  transfers/
│   │   ├── data/          # data sources (Firebase), models (freezed/json), repository impl
│   │   ├── domain/        # entities, repository (interfaces), use cases
│   │   └── presentation/  # state (Riverpod), views, widgets
├── l10n/  theme/  widgets/
```

## Regla de dependencias
`presentation → domain ← data`. El dominio no conoce Flutter/Firebase/Dio. Un feature no importa otro feature;
lo compartido sube a `core/`.

## Flujo de una petición (movimientos)
UI (`dashboard_view`) → `DashboardNotifier` → `GetMovsByPageUseCase` → `MovementsRepository` (interfaz) →
`MovementsRepositoryImpl` → `FirebaseMovementsDataSource` → Firestore.

## Cómo agregar un feature sin afectar a otros
1. Crear `specs/NNN-feature/` (spec, plan, tasks).
2. Crear `lib/features/<feature>/{data,domain,presentation}`.
3. Registrar la ruta en `core/navigation/router.dart`.
4. Tests en `test/features/<feature>/`.

## Escalar a equipos grandes
Cada feature puede extraerse a un paquete (`packages/<feature>`) con su propio `pubspec`, enlazados por
workspace de Dart/melos (monorepo). `core` pasaría a `packages/core`.

## Inyección de dependencias (Riverpod como composition root)
Los providers viven en `core/di/core_providers.dart`, `features/auth/di/auth_providers.dart` y
`features/dashboard/di/dashboard_providers.dart`. Ninguna clase de `domain` instancia implementaciones:
todo llega por constructor (`required`). En tests se sobreescribe cualquier eslabón:

```dart
ProviderContainer(overrides: [authenticationRepositoryProvider.overrideWithValue(mockRepo)]);
```
Infraestructura (`firebaseAuthProvider`, `firestoreProvider`) es el único punto que toca `FirebaseAuth.instance`
y `FirebaseFirestore.instance`.

## Manejo de errores
`core/errors/failures.dart` define una jerarquía sellada (`AuthFailure`, `NetworkFailure`, `PermissionFailure`,
`NotFoundFailure`, `ServerFailure`, `UnknownFailure`). `mapToFailure()` (`core/errors/error_mapper.dart`) traduce
excepciones de Firebase/Dio en la capa data; domain y presentation solo ven `Failure`.

## Deuda técnica conocida (honesta)
- Los repositorios de `accounts`/`cards` aún devuelven modelos de `data` (`AccountModel`, `CardModel`) al dominio;
  crear entidades `Card` y `Account` puras (el dashboard usa `CardModel` en su estado).
- `dashboard_view.dart` y `dashboard_screen.dart` son muy grandes; dividir en widgets.
- Los notifiers usan `StateNotifier` (paquete `riverpod/legacy`); migrar a `Notifier`/`AsyncNotifier`.
- `goRouterProvider` se reconstruye al cambiar el estado de login; usar `refreshListenable`.
- `get_it` está en el pubspec sin uso; eliminarlo.
- CVV y número de tarjeta completos viven en Firestore (ver specs).
