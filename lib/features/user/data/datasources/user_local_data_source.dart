import 'package:hive/hive.dart';
import '../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getUser();
  Future<void> clearUser();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final Box<UserModel> userBox;

  UserLocalDataSourceImpl({required this.userBox});

  @override
  Future<void> saveUser(UserModel user) async {
    await userBox.put('user', user);
  }

  @override
  Future<UserModel?> getUser() async {
    return userBox.get('user');
  }

  @override
  Future<void> clearUser() async {
    await userBox.delete('user');
  }
}