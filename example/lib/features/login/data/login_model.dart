import 'package:example/core/contracts/data/base_model.dart';

class LoginModel extends BaseModel {
  LoginModel({
    required this.fullName,
    required this.loginId,
    required this.balance,
  });

  LoginModel.fromJson(Map<String, dynamic> json)
      : fullName = json['fullname'],
        loginId = json['loginid'],
        balance = json['balance'].toDouble();

  final String fullName;
  final String loginId;
  final double balance;
}
