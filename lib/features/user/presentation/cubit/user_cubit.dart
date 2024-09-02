import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_parking/core/exceptions/app_exception.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/delete_user.dart';
import '../../domain/usecases/get_user.dart';
import '../../domain/usecases/save_user.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUser getUser;
  final SaveUser saveUser;
  final DeleteUser deleteUser;

  UserCubit({
    required this.getUser,
    required this.saveUser,
    required this.deleteUser,
  }) : super(UserInitial());

  // 유저 정보 가져오기
  Future<void> loadUser() async {
    emit(UserLoading());
    final result = await getUser();
    result.fold(
      (failure) => UserError("Failed to load user"),
      (user) => UserLoaded(user),
    );
  }

  // 유저 정보 저장하기 (로컬 DB)
  Future<void> saveUserToDb(User user) async {
    emit(UserLoading());
    final result = await saveUser(user);
    result.fold(
      (failure) => emit(UserError("Failed to save user")),
      (_) => emit(UserLoaded(user)),
    );
  }

  // 유저 로그아웃
  Future<void> signOutUser() async {
    emit(UserLoading());
    final result = await deleteUser();
    result.fold(
      (failure) => emit(UserError("Failed to sign out")),
      (_) => emit(UserInitial()),
    );
  }
}