import 'package:bank_app/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel> login(String email, String password) async {
    try {
      // ignore: avoid_print
      print('email/password at FirebaseLoginDataSource: $email / $password');
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = _firebaseAuth.currentUser;
      return UserModel(
        id: user!.uid,
        email: email,
        username: user.displayName ?? '',
        firstName: '',
        lastName: '',
        gender: '',
        image: '',
        accessToken: '',
        newId: '',
      );
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print('FirebaseAuthException code: ${e.code}');
      if (e.code == 'user-not-found') {
        // ignore: avoid_print
        print('No se encontró un usuario con ese correo.');
        throw Exception('User not found. Please register first.');
      } else if (e.code == 'wrong-password') {
        // ignore: avoid_print
        print('Contraseña incorrecta.');
        throw Exception('Incorrect password');
      } else if (e.code == 'invalid-email') {
        // ignore: avoid_print
        print('El email no es válido.');
        throw Exception('Invalid email format');
      } else if (e.code == 'invalid-credential') {
        // ignore: avoid_print
        print('Credencial inválida.');
        throw Exception('Invalid email or password. Please try again.');
      }
      // ignore: avoid_print
      print(e);
      throw Exception(e.message ?? 'Login failed');
    } catch (e) {
      // ignore: avoid_print
      print(e);
      throw Exception('Unknown error: $e');
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      // ignore: avoid_print
      print(e);
      throw Exception('Error al cerrar sesión: $e');
    }
  }

  Future<bool> isLoggedIn() async {
    try {
      final user = _firebaseAuth.currentUser;
      return user != null;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      throw Exception('Error al verificar el estado de inicio de sesión: $e');
    }
  }

  Future<UserModel> register(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return UserModel(
        id: _firebaseAuth.currentUser!.uid,
        email: email,
        username: _firebaseAuth.currentUser!.displayName ?? '',
        firstName: '',
        lastName: '',
        gender: '',
        image: '',
        accessToken: '',
        newId: '',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print('El correo ya está en uso.');
        throw Exception('This email is already registered');
      } else if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('La contraseña es demasiado débil.');
        throw Exception('Password must be at least 6 characters');
      } else if (e.code == 'invalid-email') {
        // ignore: avoid_print
        print('El email no es válido.');
        throw Exception('Invalid email format');
      }
      // ignore: avoid_print
      print(e);
      throw Exception(e.message ?? 'Registration failed');
    } catch (e) {
      // ignore: avoid_print
      print(e);
      throw Exception('Unknown error: $e');
    }
  }
}
