// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get signInTitle => 'Iniciar sesión';

  @override
  String get emailLabel => 'Correo electrónico';

  @override
  String get emailHint => 'nombre@ejemplo.com';

  @override
  String get passwordLabel => 'Contraseña';

  @override
  String get passwordHint => '••••••••';

  @override
  String get signInCta => 'Iniciar sesión';

  @override
  String get newUser => 'Soy un usuario nuevo.';

  @override
  String get newUserLink => 'Iniciar sesión';

  @override
  String get backTooltip => 'Volver';

  @override
  String get errors_required => 'Este campo es obligatorio';

  @override
  String get errors_invalidEmail => 'Ingresa un correo válido';

  @override
  String welcomeUser(Object userName) {
    return '¡Bienvenido, $userName!';
  }

  @override
  String get transactions => 'Transacciones';

  @override
  String get seeAll => 'Ver todas';

  @override
  String get sent => 'Enviar';

  @override
  String get receive => 'Recibir';

  @override
  String get loan => 'Prestar';

  @override
  String get topup => 'Recargar';

  @override
  String get home => 'Inicio';

  @override
  String get myCards => 'Mis tarjetas';

  @override
  String get statistics => 'Estadísticas';

  @override
  String get settings => 'Configuraciones';

  @override
  String get entertainment => 'Entretenimiento';

  @override
  String get music => 'Música';

  @override
  String get transaction => 'Transacción';

  @override
  String get grocery => 'Abarrotes';

  @override
  String get expiryDate => 'Expira';
}
