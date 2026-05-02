import 'package:bank_app/core/network/api_client.dart';
import 'package:bank_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:bank_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:bank_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:bank_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:bank_app/features/auth/presentation/providers/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Data sources
final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
  (ref) => AuthRemoteDataSourceImpl(ref.watch(apiClientProvider)),
);

// Repositories
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref.watch(authRemoteDataSourceProvider)),
);

// Use cases
final loginUseCaseProvider = Provider<LoginUseCase>(
  (ref) => LoginUseCase(ref.watch(authRepositoryProvider)),
);

// State notifier
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(loginUseCaseProvider)),
);
