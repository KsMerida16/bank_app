# Constitución del proyecto (reglas no negociables)

1. **Clean Architecture por feature.** `presentation → domain ← data`. El dominio es Dart puro.
2. **Inyección de dependencias por constructor/provider.** Prohibido `?? Impl()` dentro de dominio.
3. **Seguridad bancaria primero.** Sin credenciales/tokens/PII en logs; sin CVV ni PAN completo
   persistidos; Firestore con reglas "denegar por defecto"; datos bancarios solo lectura desde cliente.
4. **Errores tipados.** La capa data traduce excepciones de Firebase/Dio a `Failure`; la UI no ve
   excepciones crudas.
5. **Estado explícito.** Cada pantalla modela loading / success / error y evita estados imposibles.
6. **Internacionalización.** Ningún texto de usuario hardcodeado (en/es).
7. **Calidad verificable.** Cada feature con tests de use case + notifier + widget clave; CI verde
   (`analyze` + `test`) antes de mergear.
8. **Trazabilidad.** Cada feature tiene su spec en `specs/` y commits convencionales.
9. **IA con criterio.** El código generado por IA se revisa, se prueba y se entiende antes de entrar.
