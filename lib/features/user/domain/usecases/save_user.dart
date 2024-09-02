import 'package:dartz/dartz.dart';
import 'package:my_parking/core/exceptions/app_exception.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class SaveUser {
  final UserRepository repository;

  SaveUser(this.repository);

  Future<Either<AppException, void>> call(User user) async {
    return await repository.saveUser(user);
  }
}