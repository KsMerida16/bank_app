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
  String get userLabel => 'Usuario';

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

  @override
  String get back => 'Regresar';

  @override
  String get noBackPage => 'No hay  página anterior';

  @override
  String get logout => 'Cerrar Sesión';

  @override
  String get sure => 'Estas seguro de cerrar la sesión?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get exit => 'Salir';

  @override
  String get closed => 'Sesión Cerrada';

  @override
  String get myProfile => 'Mi Perfil';

  @override
  String get contactus => 'Contáctanos';

  @override
  String get security => 'Seguridad';

  @override
  String get changePassword => 'Cambiar contraseña';

  @override
  String get privatePolicy => 'Política de Privacidad';

  @override
  String get biometric => 'Biometría';

  @override
  String get biometricEnable => 'Biometría Habilitada';

  @override
  String get biometricDisabled => 'Biometría Deshabilitada';

  @override
  String get language => 'Lenguaje';

  @override
  String get languageSettings => 'Configuración de Lenguaje';

  @override
  String get profilePage => 'Página de Perfil';

  @override
  String get contactPage => 'Página de contacto';

  @override
  String get general => 'General';

  @override
  String get english => 'Inglés';

  @override
  String get spanish => 'Español';

  @override
  String get transfer => 'Transferir';

  @override
  String get thirdParty => 'Terceros';

  @override
  String get ach => 'ACH';

  @override
  String get international => 'Internacional';

  @override
  String get originAccount => 'Cuenta Origen';

  @override
  String get checkingAccount => 'Cuenta de Cheques';

  @override
  String get savingsAccount => 'Cuenta de Ahorros';

  @override
  String get destContact => 'Seleccionar Contacto';

  @override
  String get amount => 'Monto';

  @override
  String get enterAmount => 'Ingrese Monto';

  @override
  String get note => 'Nota';

  @override
  String get optionalNote => 'Nota Opcional';

  @override
  String get selectBank => 'Seccione Banco';

  @override
  String get accountNumber => 'Número de Cuenta';

  @override
  String get enterAccount => 'Ingrese Número de Cuenta';

  @override
  String get country => 'País';

  @override
  String get swiftCode => 'Código SWIFT';

  @override
  String get enterSwift => 'Ingrese código SWIFT';
}
