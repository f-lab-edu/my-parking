import '../entities/user.dart';

abstract class UserRepository {
  Future<User> getUser();
  Future<void> saveUser(User user);
  Future<void> deleteUser();
}