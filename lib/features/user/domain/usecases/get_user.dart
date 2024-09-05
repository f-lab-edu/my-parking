import 'package:dartz/dartz.dart';
import 'package:my_parking/core/exceptions/app_exception.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Future<Either<AppException, User>> call() async {
    return await repository.getUser();
  }
}