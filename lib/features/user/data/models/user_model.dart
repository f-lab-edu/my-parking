import 'package:hive/hive.dart';

import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? googleToken;

  UserModel({
    required this.id,
    required this.name,
    this.googleToken,
  });

  User toEntity() {
    return User(
      id: id,
      name: name,
      googleToken: googleToken,
    );
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      googleToken: user.googleToken,
    );
  }
}