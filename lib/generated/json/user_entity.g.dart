import 'package:flutter_app_core/generated/json/base/json_convert_content.dart';
import 'package:flutter_app_core/models/user_entity.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
	final UserEntity userEntity = UserEntity();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		userEntity.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		userEntity.name = name;
	}
	final int? age = jsonConvert.convert<int>(json['AGE']);
	if (age != null) {
		userEntity.age = age;
	}
	final UserEntity? child = jsonConvert.convert<UserEntity>(json['child']);
	if (child != null) {
		userEntity.child = child;
	}
	return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['AGE'] = entity.age;
	data['child'] = entity.child?.toJson();
	return data;
}