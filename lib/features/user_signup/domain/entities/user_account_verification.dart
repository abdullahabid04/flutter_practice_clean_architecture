import 'package:equatable/equatable.dart';

class UserAccountVerification extends Equatable {
  final int? status;
  final String? message;

  const UserAccountVerification({
    this.status,
    this.message,
  });

  @override
  List<Object?> get props => [
        status,
        message,
      ];
}
