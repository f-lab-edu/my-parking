import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/app_exception.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_local_data_source.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<AppException, User>> getUser() async {
    try {
      final userModel = await localDataSource.getUser();
      if (userModel != null) {
        return Right(userModel.toEntity());
      } else {
        return const Left(CacheFailureException());
      }
    } catch (e) {
      return const Left(CacheFailureException());
    }
  }

  @override
  Future<Either<AppException, void>> saveUser(User user) async {
    try {
      final userModel = UserModel.fromEntity(user);
      await localDataSource.saveUser(userModel);
      return const Right(null);
    } catch (e) {
      return const Left(CacheFailureException());
    }
  }

  @override
  Future<Either<AppException, void>> deleteUser() async {
    try {
      await localDataSource.clearUser();
      return const Right(null);
    } catch (e) {
      return const Left(CacheDeleteFailureException());
    }
  }
}