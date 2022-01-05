import 'package:flutter_app_core/generated/json/base/json_convert_content.dart';
import 'package:flutter_app_core/models/school_entity.dart';

SchoolEntity $SchoolEntityFromJson(Map<String, dynamic> json) {
	final SchoolEntity schoolEntity = SchoolEntity();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		schoolEntity.name = name;
	}
	return schoolEntity;
}

Map<String, dynamic> $SchoolEntityToJson(SchoolEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	return data;
}