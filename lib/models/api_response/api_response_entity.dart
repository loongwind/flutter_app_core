import 'dart:convert';
import 'package:flutter_app_core/generated/json/base/json_field.dart';
import 'package:flutter_app_core/models/api_response/api_response_entity.g.dart';

class ApiResponseEntity<T> {

	int? code;
	String? message;
	T? data;
  
  ApiResponseEntity();

  factory ApiResponseEntity.fromJson(Map<String, dynamic> json) => $ApiResponseEntityFromJson<T>(json);

  Map<String, dynamic> toJson() => $ApiResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
