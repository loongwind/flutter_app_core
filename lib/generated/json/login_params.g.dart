import 'package:flutter_app_core/generated/json/base/json_convert_content.dart';
import 'package:flutter_app_core/models/login_params.dart';

LoginParams $LoginParamsFromJson(Map<String, dynamic> json) {
	final LoginParams loginParams = LoginParams();
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		loginParams.username = username;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		loginParams.password = password;
	}
	return loginParams;
}

Map<String, dynamic> $LoginParamsToJson(LoginParams entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['username'] = entity.username;
	data['password'] = entity.password;
	return data;
}