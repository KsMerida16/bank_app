import 'package:bank_app/core/accounts/domain/entities/bank_card.dart';
import 'package:bank_app/core/accounts/domain/entities/account.dart';
import 'package:bank_app/core/accounts/domain/use_cases/get_accounts_use_case.dart';
import 'package:bank_app/core/accounts/domain/use_cases/get_cards_use_case.dart';
import 'package:bank_app/core/constants/app_firebase_tables.dart';
import 'package:bank_app/core/users/domain/entities/user.dart';
import 'package:bank_app/core/users/domain/use_cases/get_user_use_case.dart';
import 'package:bank_app/features/dashboard/domain/entities/movement.dart';
import 'package:bank_app/features/dashboard/domain/use_cases/get_movs_by_page_use_case.dart';
import 'package:bank_app/features/dashboard/presentation/state/dashboard_notifier.dart';
import 'package:bank_app/features/dashboard/presentation/state/dashboard_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetUserUseCase extends Mock implements GetUserUseCase {}

class MockGetAccountsUseCase extends Mock implements GetAccountsUseCase {}

class MockGetCardsUseCase extends Mock implements GetCardsUseCase {}

class MockGetMovsByPageUseCase extends Mock implements GetMovsByPageUseCase {}

Movement _movement(String timestamp) => Movement(
  date: '2026-01-01',
  timestamp: timestamp,
  description: 'Movimiento $timestamp',
  amount: 25.5,
  type: 'POS',
  sign: 'D',
  category: 'Comercio',
);

void main() {
  late MockGetUserUseCase getUser;
  late MockGetAccountsUseCase getAccounts;
  late MockGetCardsUseCase getCards;
  late MockGetMovsByPageUseCase getMovements;
  late DashboardNotifier notifier;

  final limit = AppFirebasePaginationConstants.defaultLimit;

  setUp(() {
    getUser = MockGetUserUseCase();
    getAccounts = MockGetAccountsUseCase();
    getCards = MockGetCardsUseCase();
    getMovements = MockGetMovsByPageUseCase();

    when(
      () => getUser.execute('uid-1'),
    ).thenAnswer((_) async => const User(email: 'ana@bank.com', name: 'Ana'));
    when(() => getAccounts.execute('uid-1')).thenAnswer(
      (_) async => const <Account>[
        Account(
          accountUserId: 'uid-1',
          accountNumber: '0001',
          accountType: 'Ahorro',
          accountBalance: 1500,
        ),
      ],
    );
    when(
      () => getCards.execute('uid-1'),
    ).thenAnswer((_) async => <BankCard>[]);

    notifier = DashboardNotifier(
      getUserUseCase: getUser,
      getAccountsUseCase: getAccounts,
      getCardsUseCase: getCards,
      getMovementsUseCase: getMovements,
    );
  });

  DashboardState? loadedOrNull() =>
      notifier.state.maybeWhen(loaded: (_, _, _, _, _, _, _) => notifier.state, orElse: () => null);

  test('estado inicial', () {
    expect(
      notifier.state.maybeWhen(initial: () => true, orElse: () => false),
      isTrue,
    );
  });

  test('loadDashboard carga datos y marca hasMore si la página está llena', () async {
    final firstPage = List.generate(limit, (i) => _movement('t$i'));
    when(
      () => getMovements.call('uid-1', limit, ''),
    ).thenAnswer((_) async => firstPage);

    await notifier.loadDashboard('uid-1');

    final loaded = loadedOrNull();
    expect(loaded, isNotNull);
    loaded!.maybeWhen(
      loaded: (user, accounts, cards, movements, hasMore, loadingMore, last) {
        expect(user.email, 'ana@bank.com');
        expect(accounts, hasLength(1));
        expect(movements, hasLength(limit));
        expect(hasMore, isTrue);
        expect(loadingMore, isFalse);
        expect(last, 't${limit - 1}');
      },
      orElse: () => fail('se esperaba el estado loaded'),
    );
  });

  test('loadDashboard con página incompleta -> hasMore = false', () async {
    when(
      () => getMovements.call('uid-1', limit, ''),
    ).thenAnswer((_) async => [_movement('t0')]);

    await notifier.loadDashboard('uid-1');

    notifier.state.maybeWhen(
      loaded: (_, _, _, _, hasMore, _, _) => expect(hasMore, isFalse),
      orElse: () => fail('se esperaba el estado loaded'),
    );
  });

  test('loadDashboard con error -> estado error', () async {
    when(() => getUser.execute('uid-1')).thenThrow(Exception('boom'));

    await notifier.loadDashboard('uid-1');

    expect(
      notifier.state.maybeWhen(error: (message) => message, orElse: () => null),
      contains('boom'),
    );
  });

  test('loadMoreMovements agrega la siguiente página sin duplicados', () async {
    final firstPage = List.generate(limit, (i) => _movement('t$i'));
    final nextTimestamp = 't${limit - 1}';
    when(
      () => getMovements.call('uid-1', limit, ''),
    ).thenAnswer((_) async => firstPage);
    when(() => getMovements.call('uid-1', limit, nextTimestamp)).thenAnswer(
      (_) async => [_movement(nextTimestamp), _movement('tNuevo')],
    );

    await notifier.loadDashboard('uid-1');
    await notifier.loadMoreMovements();

    notifier.state.maybeWhen(
      loaded: (_, _, _, movements, _, loadingMore, _) {
        expect(movements.map((m) => m.timestamp).toSet(), hasLength(limit + 1));
        expect(loadingMore, isFalse);
      },
      orElse: () => fail('se esperaba el estado loaded'),
    );
  });

  test('si falla "cargar más", el dashboard se conserva y se puede reintentar', () async {
    final firstPage = List.generate(limit, (i) => _movement('t$i'));
    when(
      () => getMovements.call('uid-1', limit, ''),
    ).thenAnswer((_) async => firstPage);
    when(
      () => getMovements.call('uid-1', limit, 't${limit - 1}'),
    ).thenThrow(Exception('sin red'));

    await notifier.loadDashboard('uid-1');
    await notifier.loadMoreMovements();

    notifier.state.maybeWhen(
      loaded: (_, _, _, movements, hasMore, loadingMore, _) {
        expect(movements, hasLength(limit));
        expect(hasMore, isTrue);
        expect(loadingMore, isFalse);
      },
      orElse: () => fail('el estado debe seguir en loaded tras un error al paginar'),
    );
  });
}
