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

## Deuda técnica conocida (honesta)
- Use cases aún instancian implementaciones por defecto (`?? Impl()`); migrar a providers de Riverpod.
- `dashboard_view.dart` y `dashboard_screen.dart` son muy grandes; dividir en widgets.
- `Notifier` de auth/dashboard usan `StateNotifier` (legacy); migrar a `Notifier`/`AsyncNotifier`.
- Errores como `Exception(String)`; migrar a `Failure` tipado.
- `get_it` en el pubspec sin uso.
