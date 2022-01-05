import 'dart:convert';
import 'package:flutter_app_core/generated/json/base/json_field.dart';
import 'package:flutter_app_core/generated/json/school_entity.g.dart';

@JsonSerializable()
class SchoolEntity {

	String? name;
  
  SchoolEntity();

  factory SchoolEntity.fromJson(Map<String, dynamic> json) => $SchoolEntityFromJson(json);

  Map<String, dynamic> toJson() => $SchoolEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}