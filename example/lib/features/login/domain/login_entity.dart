import 'package:example/core/contracts/domain/base_entity.dart';

class LoginEntity extends BaseEntity {
  LoginEntity({
    required this.fullName,
    required this.loginId,
    required this.balance,
  });

  final String fullName;
  final String loginId;
  final double balance;
}
