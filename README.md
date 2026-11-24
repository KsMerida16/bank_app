# BankPick — bank_app (Proyecto Integrador Acelera TI · Flutter BAM)

App bancaria móvil en Flutter con Firebase.

| Área | Tecnología |
|---|---|
| UI | Flutter 3.x, Material 3, tema claro/oscuro, i18n es/en |
| Estado | Riverpod |
| Navegación | go_router (rutas protegidas) |
| Backend | Firebase Auth, Firestore, Cloud Messaging |
| Arquitectura | Clean Architecture + modularización por feature |
| Calidad | mocktail, flutter_test, GitHub Actions |
| IA | Spec-Driven Development (`specs/`), `AGENTS.md`, MCP (`.mcp.json`) |

## Ejecutar
```bash
flutter pub get
flutter run -t lib/main_dev.dart        # dev   (env_dev.json)
flutter run -t lib/main_prod.dart       # prod  (env_prod.json)
```

## Generación de código
```bash
dart run build_runner build --delete-conflicting-outputs   # freezed + json_serializable
flutter gen-l10n
```

## Calidad
```bash
dart format lib test
flutter analyze
flutter test --coverage
```
CI (`.github/workflows/ci.yml`) ejecuta análisis y tests en cada push/PR y compila un APK dev en `master`.

## Documentación
- [Arquitectura](docs/ARCHITECTURE.md)
- [Mapa de evidencias vs. rúbrica](docs/RUBRICA.md)
- [Guía de sustentación](docs/SUSTENTACION.md)
- [Specs (SDD)](specs/) · [Constitución](specs/constitution.md) · [AGENTS.md](AGENTS.md)
- [Documentación Sprint 4](doc/sprint4/Sprint4-Documentation.md)

## Flujo de ramas y versionado
- `master` protegida; trabajo en `feature/*`, `fix/*`, `chore/*` y Pull Request con CI verde.
- Commits: Conventional Commits. Versiones con tags semánticos (`v1.0.0`) y `version:` en `pubspec.yaml`.

## Seguridad (resumen)
Sin credenciales/tokens en logs · reglas Firestore "deny by default" (`firestore.rules`) ·
datos bancarios de solo lectura desde el cliente · sin CVV persistido (ver specs).
