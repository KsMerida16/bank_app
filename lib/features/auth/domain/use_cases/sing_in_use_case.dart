import 'package:bank_app/features/auth/data/repositories/authentication_repository_impl.dart';
import 'package:bank_app/features/auth/domain/entities/user.dart';
import 'package:bank_app/features/auth/domain/repositories/authentication_repository.dart';

class SignInUseCase {
  SignInUseCase({AuthenticationRepository? authenticationRepository})
    : _authenticationRepository =
          authenticationRepository ?? AuthenticationRepositoryImpl();
  final AuthenticationRepository _authenticationRepository;

  Future<User> call(String email, String password) async {
    // Aquí iría la lógica de autenticación, por ejemplo, llamando a un repositorio
    // que se encargue de hacer la petición a un servidor.
    // Por simplicidad, vamos a simular una autenticación exitosa si el email y la contraseña no están vacíos.
    final user = await _authenticationRepository.signInWithEmailAndPassword(
      email,
      password,
    );

    await _authenticationRepository.saveSession(
      'fake_token',
    ); // Simulamos guardar una sesión

    return user;
  }
}
