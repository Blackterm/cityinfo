import 'package:cityinfo/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getCurrentUser();
  Future<void> signInWithEmail(String email, String password);
  Future<void> createUser(
      String firstName, String lastName, String email, String password);
}
