# 004 — Inyección de dependencias y errores tipados

## Objetivo
Desacoplar dominio de implementaciones y unificar el manejo de errores (rúbrica: Arquitectura, Backend, Calidad).

## Criterios de aceptación
- [x] Ningún use case/repositorio instancia implementaciones (`?? Impl()`); todo `required` por constructor.
- [x] Composición en providers de Riverpod (`core/di`, `features/*/di`); `FirebaseAuth`/`Firestore` solo en `core_providers.dart`.
- [x] Jerarquía `Failure` sellada y `mapToFailure()` para Firebase y Dio.
- [x] Ningún `throw Exception('texto')` en `lib/`.
- [x] Tests: mapper, data source de auth, repositorio de auth, repositorio de movimientos, override de providers.
- [ ] Entidades de dominio puras para `Account` y `Card` (hoy el dominio devuelve modelos de data).
- [ ] Mensajes de `Failure` localizados (l10n) en la capa de presentación.

## Decisiones
- Riverpod como composition root en lugar de `get_it`: un solo mecanismo de DI, overrides triviales en tests.
- `Failure` sellado (sealed) para forzar manejo exhaustivo con `switch`.
- `mapToFailure` es idempotente para poder usarse en data source y repositorio sin doble envoltura.
