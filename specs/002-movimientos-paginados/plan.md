# Plan — Movimientos
- `FirebaseMovementsDataSource.getMovementsByPage` (data) → `MovementsRepositoryImpl` → `GetMovsByPageUseCase`.
- `DashboardNotifier.loadDashboard/loadMoreMovements` mantiene `lastMovementTimestamp`, `hasMore`, `isLoadingMore`.
- Límite por defecto en `AppFirebasePaginationConstants.defaultLimit`.

## Pruebas
`get_movs_by_page_use_case_test.dart`, `dashboard_notifier_test.dart`.
