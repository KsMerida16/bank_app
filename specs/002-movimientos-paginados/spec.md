# 002 — Historial de movimientos con paginación (HU 4.2)

## Objetivo
Mostrar el historial de transacciones del cliente cargando por páginas para reducir lecturas y memoria.

## Criterios de aceptación
- [x] Consulta Firestore `movs` filtrada por `user_id`, ordenada por `timestamp`, con `limit`.
- [x] "Cargar más" usa cursor (`startAfter`) y no duplica movimientos.
- [x] `hasMore` es falso cuando la página llega incompleta.
- [x] Estado de carga de la página siguiente independiente del estado de la pantalla.
- [ ] Un error al paginar NO reemplaza el dashboard completo por pantalla de error.
- [ ] Cursor basado en `DocumentSnapshot` o timestamp tipado (no string).
- [ ] Índice compuesto documentado/desplegado (`user_id` + `timestamp`).

## Riesgos
Lecturas excesivas (costo), datos de otro usuario si las reglas no filtran por dueño (ver `firestore.rules`).
