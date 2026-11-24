# AGENTS.md — Guía para agentes de código (bank_app / BankPick)

Este archivo lo leen los agentes de IA (Claude Code, Copilot, etc.) antes de tocar el repo.
Si algo aquí contradice una instrucción puntual del usuario, gana el usuario.

## Qué es el proyecto
App bancaria móvil en Flutter (proyecto integrador Acelera TI · Flutter BAM).
Backend: Firebase (Auth, Firestore, Cloud Messaging). Estado: Riverpod. Navegación: go_router.

## Flujo de trabajo (Spec-Driven Development)
1. Todo cambio de comportamiento empieza en `specs/NNN-nombre/spec.md` (qué y por qué).
2. Luego `plan.md` (cómo: capas, archivos, decisiones) y `tasks.md` (pasos verificables).
3. Se implementa tarea por tarea, con tests, y se marca el checklist en `tasks.md`.
4. Las reglas no negociables están en `specs/constitution.md`.
Usa `specs/_template/` para crear un feature nuevo.

## Arquitectura (resumen; detalle en docs/ARCHITECTURE.md)
- `lib/features/<feature>/{data,domain,presentation}` — un feature no importa a otro feature.
- `lib/core/` — código compartido (errores, red, logging, navegación, entornos, notificaciones).
- Dependencias: `presentation → domain ← data`. `domain` no importa Flutter, Firebase ni Dio.
- Los use cases y repositorios reciben sus dependencias por constructor (`required`); nunca `?? Impl()`.
- Las dependencias se cablean SOLO en `**/di/*_providers.dart` (Riverpod). Un notifier recibe use cases, no repos.
- Data traduce toda excepción con `mapToFailure()`; domain/presentation solo manejan `Failure`.

## Comandos
```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # freezed / json_serializable
flutter gen-l10n
flutter analyze
dart format lib test
flutter test --coverage
flutter run -t lib/main_dev.dart                            # entorno dev
```

## Reglas para el agente
- NUNCA usar `print`; usar `AppLogger` (`lib/core/logging/app_logger.dart`).
- NUNCA lanzar `Exception('texto')`; lanzar un `Failure` (`lib/core/errors/failures.dart`).
- NUNCA registrar ni persistir contraseñas, tokens, CVV ni números completos de tarjeta.
- Todo texto visible al usuario va en `lib/l10n/*.arb` (en y es), no hardcodeado.
- Imports siempre `package:bank_app/...` (regla `always_use_package_imports`).
- No editar archivos generados (`*.freezed.dart`, `*.g.dart`, `app_localizations*.dart`).
- Cada cambio en `domain` o en un notifier debe traer o actualizar tests en `test/`.
- Cambios de reglas de seguridad en `firestore.rules` requieren revisión humana explícita.
- Commits con Conventional Commits: `feat(scope): ...`, `fix(scope): ...`, `chore: ...`.

## MCP (Model Context Protocol)
Servidores MCP recomendados para este repo (ver `.mcp.json`):
- **Firebase MCP**: consultar proyecto, reglas y colecciones del proyecto `bankpick` en entorno dev.
- **GitHub MCP**: issues, PRs y revisión de CI.
Regla: los agentes usan MCP solo contra el entorno **dev**; jamás contra producción.
