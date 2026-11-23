# Guía de sustentación (borrador para ensayar)

Preguntas del panel (tomadas de la rúbrica) y puntos clave de respuesta. Completa con tus palabras y con lo que
realmente implementaste: el panel evalúa Conocimiento y Demostración.

## Arquitectura / Modularización
- Capas: data (Firebase, models freezed), domain (entities, repos abstractos, use cases), presentation (Riverpod + vistas).
- Desacople: el dominio depende de interfaces; las implementaciones viven en data.
- Nuevo feature: spec → carpeta de feature → ruta → tests, sin tocar otros features.
- Escalar: paquetes por feature en monorepo (melos) vs. microrepos; ventajas/costos de cada uno.

## Estado
- Por qué Riverpod: testeable, sin BuildContext, composición de providers.
- loading/error/success: clases selladas (login) y freezed (dashboard); evitar estados imposibles.

## Backend / Seguridad
- Firebase Auth (token ID gestionado por el SDK), rutas protegidas con `redirect`.
- Firestore: reglas deny-by-default, lectura solo del dueño, escrituras solo backend.
- Vulnerabilidades consideradas: credenciales en logs, CVV/PAN en BD, reglas abiertas, sesión en dispositivo compartido.

## Calidad / Testing / CI
- Clean code: `AppLogger`, sin código muerto, lints. SOLID: inversión de dependencias vía interfaces.
- Tests: use case, notifiers, widget; mocktail; `flutter test --coverage` en CI.

## IA
- Flujo SDD (spec→plan→tasks), `AGENTS.md`, MCP (Firebase/GitHub). Cómo validas: tests, revisión, CI.
- Riesgos: alucinaciones, filtración de secretos, código no entendido.

## Preguntas de cierre
- ¿Qué harías diferente? (DI con providers, `Failure` tipado, perfil por uid, no guardar CVV, paquetes por feature.)
- ¿Mayor reto? (coordinar capas y FCM en background; paginación con cursor.)
- ¿Cómo escalarías en BAM? (feature flags, observabilidad, backend para operaciones, pipelines por entorno.)
