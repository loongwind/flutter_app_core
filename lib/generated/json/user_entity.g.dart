import 'package:flutter_app_core/generated/json/base/json_convert_content.dart';
import 'package:flutter_app_core/models/user_entity.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
	final UserEntity userEntity = UserEntity();
	final String? userId = jsonConvert.convert<String>(json['userId']);
	if (userId != null) {
		userEntity.userId = userId;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		userEntity.username = username;
	}
	final int? age = jsonConvert.convert<int>(json['age']);
	if (age != null) {
		userEntity.age = age;
	}
	return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['userId'] = entity.userId;
	data['username'] = entity.username;
	data['age'] = entity.age;
	return data;
}