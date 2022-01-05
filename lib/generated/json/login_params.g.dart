import 'package:flutter_app_core/generated/json/base/json_convert_content.dart';
import 'package:flutter_app_core/models/login_params.dart';

LoginParams $LoginParamsFromJson(Map<String, dynamic> json) {
	final LoginParams loginParams = LoginParams();
	final String? account = jsonConvert.convert<String>(json['account']);
	if (account != null) {
		loginParams.account = account;
	}
	final String? code = jsonConvert.convert<String>(json['code']);
	if (code != null) {
		loginParams.code = code;
	}
	final String? grantType = jsonConvert.convert<String>(json['grantType']);
	if (grantType != null) {
		loginParams.grantType = grantType;
	}
	final String? key = jsonConvert.convert<String>(json['key']);
	if (key != null) {
		loginParams.key = key;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		loginParams.password = password;
	}
	final String? refreshToken = jsonConvert.convert<String>(json['refreshToken']);
	if (refreshToken != null) {
		loginParams.refreshToken = refreshToken;
	}
	final String? tenant = jsonConvert.convert<String>(json['tenant']);
	if (tenant != null) {
		loginParams.tenant = tenant;
	}
	return loginParams;
}

Map<String, dynamic> $LoginParamsToJson(LoginParams entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['account'] = entity.account;
	data['code'] = entity.code;
	data['grantType'] = entity.grantType;
	data['key'] = entity.key;
	data['password'] = entity.password;
	data['refreshToken'] = entity.refreshToken;
	data['tenant'] = entity.tenant;
	return data;
}