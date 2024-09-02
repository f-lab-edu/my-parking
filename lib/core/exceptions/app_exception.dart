import 'package:equatable/equatable.dart';

/// 추상 AppException 클래스 정의
abstract class AppException extends Equatable implements Exception {
  final String message;
  final String identifier;

  const AppException({
    required this.message,
    required this.identifier,
  });

  @override
  String toString() {
    return 'message=$message\nidentifier=$identifier';
  }

  @override
  List<Object?> get props => [message, identifier];
}

class CacheFailureException extends AppException {
  const CacheFailureException()
      : super(
          message: '캐시 메모리 데이터 저장 실패',
          identifier: 'CacheFailureException',
        );
}

class CacheDeleteFailureException extends AppException {
  const CacheDeleteFailureException()
      : super(
          message: '캐시 메모리 데이터 삭제 실패',
          identifier: 'CacheDeleteFailureException',
        );
}

class CacheInitializationFailureException extends AppException {
  const CacheInitializationFailureException()
      : super(
          message: '캐시 메모리 초기화 실패',
          identifier: 'CacheInitializationFailureException',
        );
}