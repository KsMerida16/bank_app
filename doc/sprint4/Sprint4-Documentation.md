# Curso de Flutter Avanzado
## Sprint 4 - Documentación
## Responsables:
- **David Guerra** (david.guerra.gt@gmail.com)
- **Keilly Figeroa** (ksmerida16@gmail.com)

## Alcance del Sprint
- Autenticación de usuarios con Firebase - Authentication.
- Implementación de datos de la aplicación en Firebase Firestore.
- Implementación de pagineo de datos en la aplicación.
- Implementación de la funcionalidad de notificaciones push con Firebase Cloud Messaging (FCM).

## Implementaciones
### Autenticación de usuarios con Firebase - Authentication
- Se implementó la autenticación de usuarios utilizando Firebase Authentication, permitiendo a los usuarios registrarse e iniciar sesión en la aplicación de manera segura. Se utilizaron métodos de autenticación como correo electrónico y contraseña.
- Adicionalmente, se implementó el registro de datos del usuario en Firebase Firestore, almacenando información relevante como nombre, apellido, correo electrónico, género y nombre del usuario a mostrar.

### Implementación de datos de la aplicación en Firebase Firestore
- Se configuró Firebase Firestore para almacenar y gestionar los datos de la aplicación. Esto incluye la creación de colecciones y documentos para organizar la información de manera eficiente.
- Se implementó la colección de datos de cuentas bancarias del usuario (colección `accounts`) en Firebase Firestore, con información de número de la cuenta, tipo de la cuenta, saldo, nombre la cuenta, moneda y usuario dueño de la cuenta.
- Se implementó también la colección de datos de tarjetas de crédito del usuario (colección `cards`) en Firebase Firestore, con información de número de la tarjeta, nombre del titular, fecha de vencimiento, CVV, y usuario dueño de la tarjeta.
- Se implementó la colección de datos de transacciones del usuario (colección `movs`) en Firebase Firestore, con información de número de la cuenta, monto de la transacción, categoría de transacción, fecha, signo (C o D), tipo de la transacción (Descripción de la operación), nombre de la cuenta y usuario dueño de la cuenta.

### Implementación de pagineo de datos en la aplicación
- Se implementó la funcionalidad de pagineo de datos en la aplicación, permitiendo a los usuarios cargar y visualizar cantidades de datos definidas por página. Esto mejora la experiencia del usuario al navegar por grandes conjuntos de datos, como transacciones (colección `movs`).

### Implementación de la funcionalidad de notificaciones push con Firebase Cloud Messaging (FCM)
- Se implementó la funcionalidad de notificaciones push utilizando Firebase Cloud Messaging (FCM), permitiendo a la aplicación enviar notificaciones a los usuarios en tiempo real. Esto incluye la configuración de FCM en el proyecto de Firebase y la integración con la aplicación Flutter.
- Se implementó la funcionalidad de visualización de notificaciones push en la aplicación, permitiendo a los usuarios recibir y ver notificaciones relevantes relacionadas con sus cuentas bancarias, tarjetas de crédito y transacciones; o de promociones y novedades de la aplicación.
- Las notificaciones push pueden ser visualizadas tanto cuando la aplicación está en primer plano como en segundo plano, asegurando que los usuarios estén siempre informados sobre eventos importantes.

### Conclusión
- En este sprint se lograron implementar con éxito las funcionalidades de autenticación de usuarios, almacenamiento de datos en Firebase Firestore, pagineo de datos y notificaciones push con Firebase Cloud Messaging (FCM). Estas implementaciones mejoran significativamente la experiencia del usuario y la funcionalidad general de la aplicación.

### Imagenes de la Implementación

- **Imagen 1:** Pantalla de inicio de sesión y registro de usuarios.
    ![Pantalla de inicio de sesión y registro de usuarios](/doc/sprint4/img/Login.jpg)
- **Imagen 2:** Pantalla de visualización de cuentas bancarias.
    ![Pantalla de visualización de cuentas bancarias](/doc/sprint4/img/Accounts.jpg)
- **Imagen 3:** Pantalla de visualización de tarjetas de crédito.
    ![Pantalla de visualización de tarjetas de crédito](/doc/sprint4/img/Cards.jpg)
- **Imagen 4:** Pantalla de visualización de transacciones.
    ![Pantalla de visualización de transacciones](/doc/sprint4/img/Movs.jpg)
- **Imagen 5:** Ejemplo de notificación push recibida en la aplicación.
    ![Ejemplo de notificación push recibida en la aplicación](/doc/sprint4/img/Notification.jpg)

