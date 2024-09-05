import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/app_exception.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<AppException, User>> getUser();
  Future<Either<AppException, void>> saveUser(User user);
  Future<Either<AppException, void>> deleteUser();
}