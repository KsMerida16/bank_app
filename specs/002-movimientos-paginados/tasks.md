# Tareas — Movimientos
- [x] T1 Use case + tests de delegación y error
- [x] T2 Tests del notifier (carga inicial, hasMore, error, siguiente página sin duplicados)
- [x] T3 Un error al paginar conserva el dashboard cargado (con test); mostrar aviso/reintento en la UI queda pendiente
- [ ] T4 Quitar `as dynamic` en `loadMoreMovements` (usar pattern matching de freezed)
- [ ] T5 Cursor tipado + índice compuesto en `firestore.indexes.json`
- [ ] T6 Subir `defaultLimit` a un valor real (hoy 2, de demo) y medir lecturas
