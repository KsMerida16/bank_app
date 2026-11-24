import 'package:bank_app/core/accounts/data/data_sources/firebase_accounts_data_source.dart';
import 'package:bank_app/core/accounts/data/data_sources/firebase_cards_data_source.dart';
import 'package:bank_app/core/accounts/data/repositories/accounts_repository_impl.dart';
import 'package:bank_app/core/accounts/data/repositories/cards_repository_impl.dart';
import 'package:bank_app/core/accounts/domain/repositories/accounts_repository.dart';
import 'package:bank_app/core/accounts/domain/repositories/cars_repository.dart';
import 'package:bank_app/core/accounts/domain/use_cases/get_accounts_use_case.dart';
import 'package:bank_app/core/accounts/domain/use_cases/get_cards_use_case.dart';
import 'package:bank_app/core/catalogs/data/data_sources/firebase_catalogs_data_source.dart';
import 'package:bank_app/core/catalogs/data/repositories/catalogs_repository_impl.dart';
import 'package:bank_app/core/catalogs/domain/repositories/catalog_repository.dart';
import 'package:bank_app/core/catalogs/domain/use_cases/get_catalog_use_case.dart';
import 'package:bank_app/core/users/data/data_sources/firestore_users_data_source.dart';
import 'package:bank_app/core/users/data/repositories/users_repository_impl.dart';
import 'package:bank_app/core/users/domain/repositories/users_repository.dart';
import 'package:bank_app/core/users/domain/use_cases/get_user_use_case.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ── Infraestructura (en tests se sobreescribe con fakes/mocks) ──────────────
final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);

final firestoreProvider = Provider<FirebaseFirestore>(
  (ref) => FirebaseFirestore.instance,
);

// ── Users ───────────────────────────────────────────────────────────────────
final firestoreUsersDataSourceProvider = Provider<FirestoreUsersDataSource>(
  (ref) => FirestoreUsersDataSource(firestore: ref.watch(firestoreProvider)),
);

final usersRepositoryProvider = Provider<UsersRepository>(
  (ref) => UsersRepositoryImpl(
    firestoreUsersDataSource: ref.watch(firestoreUsersDataSourceProvider),
  ),
);

final getUserUseCaseProvider = Provider<GetUserUseCase>(
  (ref) => GetUserUseCase(usersRepository: ref.watch(usersRepositoryProvider)),
);

// ── Accounts ────────────────────────────────────────────────────────────────
final accountsRepositoryProvider = Provider<AccountsRepository>(
  (ref) => AccountsRepositoryImpl(
    firebaseAccountsDataSource: FirebaseAccountsDataSource(
      firestore: ref.watch(firestoreProvider),
    ),
  ),
);

final getAccountsUseCaseProvider = Provider<GetAccountsUseCase>(
  (ref) => GetAccountsUseCase(
    accountsRepository: ref.watch(accountsRepositoryProvider),
  ),
);

// ── Cards ───────────────────────────────────────────────────────────────────
final cardsRepositoryProvider = Provider<CardsRepository>(
  (ref) => CardsRepositoryImpl(
    firebaseCardsDataSource: FirebaseCardsDataSource(
      firestore: ref.watch(firestoreProvider),
    ),
  ),
);

final getCardsUseCaseProvider = Provider<GetCardsUseCase>(
  (ref) =>
      GetCardsUseCase(cardsRepository: ref.watch(cardsRepositoryProvider)),
);

// ── Catalogs ────────────────────────────────────────────────────────────────
final catalogRepositoryProvider = Provider<CatalogRepository>(
  (ref) => CatalogsRepositoryImpl(
    firebaseCatalogsDataSource: FirebaseCatalogsDataSource(
      firestore: ref.watch(firestoreProvider),
    ),
  ),
);

final getCatalogUseCaseProvider = Provider<GetCatalogUseCase>(
  (ref) => GetCatalogUseCase(
    catalogRepository: ref.watch(catalogRepositoryProvider),
  ),
);
