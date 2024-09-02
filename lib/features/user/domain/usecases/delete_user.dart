import 'package:dartz/dartz.dart';
import 'package:my_parking/core/exceptions/app_exception.dart';
import '../repositories/user_repository.dart';

class DeleteUser {
  final UserRepository repository;

  DeleteUser(this.repository);

  Future<Either<AppException, void>> call() async {
    return await repository.deleteUser();
  }
}