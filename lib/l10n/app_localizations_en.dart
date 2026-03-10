// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get signInTitle => 'Sign In';

  @override
  String get emailLabel => 'Email Address';

  @override
  String get emailHint => 'name@example.com';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHint => '••••••••';

  @override
  String get signInCta => 'Sign In';

  @override
  String get newUser => 'I\'m a new user.';

  @override
  String get newUserLink => 'Sign In';

  @override
  String get backTooltip => 'Back';

  @override
  String get errors_required => 'This field is required';

  @override
  String get errors_invalidEmail => 'Enter a valid email address';

  @override
  String welcomeUser(Object userName) {
    return 'Welcome, $userName!';
  }

  @override
  String get transactions => 'Transactions';

  @override
  String get seeAll => 'See All';

  @override
  String get sent => 'Sent';

  @override
  String get receive => 'Receive';

  @override
  String get loan => 'Loan';

  @override
  String get topup => 'Topup';

  @override
  String get home => 'Home';

  @override
  String get myCards => 'My Cards';

  @override
  String get statistics => 'Statistics';

  @override
  String get settings => 'Settings';

  @override
  String get entertainment => 'Entertainment';

  @override
  String get music => 'Music';

  @override
  String get transaction => 'transaction';

  @override
  String get grocery => 'Grocery';

  @override
  String get expiryDate => 'Expiry Date';
}
