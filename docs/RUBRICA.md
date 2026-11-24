# Mapa de evidencias vs. rúbrica del panel técnico

Estado: ✅ evidencia en el repo · 🟡 parcial · 🔴 pendiente

| Competencia (peso) | Estado | Evidencia / pendiente |
|---|---|---|
| Arquitectura Mobile (4) | ✅/🟡 | Capas por feature, DI con providers (sin `?? Impl()`), `docs/ARCHITECTURE.md`. Pendiente: entidades puras para cuentas/tarjetas. |
| Manejo de Estado (3) | 🟡 | Riverpod; estados sellados de login; freezed en dashboard. Pendiente: `Notifier` moderno, `loadMoreError`. |
| UI/UX y Responsividad (2) | 🟡 | Temas claro/oscuro, l10n es/en. Pendiente: dividir vistas gigantes, `themeMode` configurable. |
| Integración Backend (4) | ✅/🟡 | Firebase Auth/Firestore/FCM tras data sources y repos; `Failure` sellado + `mapToFailure`; `ApiClient` Dio tipado. Pendiente: validación de respuestas de backend REST. |
| Seguridad y Autenticación (3) | 🟡 | Sin credenciales en logs, `firestore.rules`, rutas protegidas. Pendiente: sin CVV/PAN, restaurar sesión, perfil por uid. |
| Modularización y Escalabilidad (4) | 🟡 | Features + `core/`. Pendiente: extraer paquetes, mover dominios de `core/`. |
| Calidad de Código (4) | 🟡 | `AppLogger`, `flutter analyze` limpio, código muerto eliminado, sin `Exception(String)`. Pendiente: partir archivos grandes, l10n completo. |
| Testing y Calidad (2) | 🟡 | Tests de use cases, repositorios, data source, mapper de errores, DI, notifiers y widget + CI con cobertura. Pendiente: medir y ampliar cobertura (>50%), widget tests de pantallas. |
| DevOps y CI/CD (2) | ✅/🟡 | GitHub Actions (analyze, test, APK), ramas/PRs, Conventional Commits. Pendiente: tags, distribución. |
| Uso de IA (1) | 🟡 | `AGENTS.md`, `specs/` (SDD), `.mcp.json`. Pendiente: grafo Graphify, bitácora de prompts. |
| Performance (2) | 🟡 | Paginación con cursor. Pendiente: caché, medición (DevTools), lazy lists. |
| Sustentación Técnica (4) | 🟡 | `docs/SUSTENTACION.md`. Pendiente: ensayar. |
