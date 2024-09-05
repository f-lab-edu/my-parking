import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String? googleToken;

  const User({
    required this.id,
    required this.name,
    required this.googleToken,
  });

  @override
  List<Object?> get props => [id, name, googleToken];
}