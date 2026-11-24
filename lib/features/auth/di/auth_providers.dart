import 'package:bank_app/core/di/core_providers.dart';
import 'package:bank_app/features/auth/data/data_sources/firebase_authentication_data_source.dart';
import 'package:bank_app/features/auth/data/repositories/authentication_repository_impl.dart';
import 'package:bank_app/features/auth/domain/repositories/authentication_repository.dart';
import 'package:bank_app/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:bank_app/features/auth/domain/use_cases/signed_in_use_case.dart';
import 'package:bank_app/features/auth/domain/use_cases/sing_in_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthenticationDataSourceProvider =
    Provider<FirebaseAuthenticationDataSource>(
      (ref) => FirebaseAuthenticationDataSource(
        firebaseAuth: ref.watch(firebaseAuthProvider),
      ),
    );

final authenticationRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) => AuthenticationRepositoryImpl(
    firebaseAuthenticationDataSource: ref.watch(
      firebaseAuthenticationDataSourceProvider,
    ),
    firestoreUsersDataSource: ref.watch(firestoreUsersDataSourceProvider),
  ),
);

final signInUseCaseProvider = Provider<SignInUseCase>(
  (ref) => SignInUseCase(
    authenticationRepository: ref.watch(authenticationRepositoryProvider),
  ),
);

final signedInUseCaseProvider = Provider<SignedInUseCase>(
  (ref) => SignedInUseCase(
    authenticationRepository: ref.watch(authenticationRepositoryProvider),
  ),
);

final signOutUseCaseProvider = Provider<SignOutUseCase>(
  (ref) => SignOutUseCase(
    authenticationRepository: ref.watch(authenticationRepositoryProvider),
  ),
);
