# 001 — Autenticación con Firebase (HU 4.1)

## Objetivo
Permitir a un cliente iniciar y cerrar sesión de forma segura y proteger las rutas privadas.

## Historias de usuario
- Como cliente, quiero iniciar sesión con correo y contraseña para ver mis productos.
- Como cliente, quiero cerrar sesión para proteger mi información en un dispositivo compartido.

## Criterios de aceptación
- [x] Login con Firebase Auth (email/contraseña) con mensajes de error entendibles.
- [x] Tras login se carga el perfil desde Firestore (`users`).
- [x] Rutas privadas redirigen a `/signin` si no hay sesión (go_router `redirect`).
- [x] Cerrar sesión limpia el estado y vuelve al login.
- [x] Ninguna credencial aparece en logs (`AppLogger`, sin datos sensibles).
- [ ] Al reiniciar la app, la sesión vigente de Firebase se restaura (`checkIfLogged` al arranque).
- [ ] Si falla la carga del perfil, se informa al usuario en vez de entrar con datos parciales.
- [x] Búsqueda de perfil por `uid` (no por email).

## Fuera de alcance
Login social (Google/Facebook), registro, biometría.

## Riesgos de seguridad
Fuerza bruta (mitigado por Firebase Auth), sesión en dispositivo compartido, filtrado de datos en logs.
