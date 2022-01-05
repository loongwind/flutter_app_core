import 'dart:convert';

import 'package:flutter_app_core/generated/json/base/json_field.dart';
import 'package:flutter_app_core/generated/json/login_params.g.dart';

@JsonSerializable()
class LoginParams {

	String? account;
	String? code;
	String? grantType;
	String? key;
	String? password;
	String? refreshToken;
	String? tenant;

  LoginParams();

  factory LoginParams.fromJson(Map<String, dynamic> json) => $LoginParamsFromJson(json);

  Map<String, dynamic> toJson() => $LoginParamsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}