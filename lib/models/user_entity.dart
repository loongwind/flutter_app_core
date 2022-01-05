import 'dart:convert';
import 'package:flutter_app_core/generated/json/base/json_field.dart';
import 'package:flutter_app_core/generated/json/user_entity.g.dart';

@JsonSerializable()
class UserEntity {
   String? id;
   @JSONField(serialize: false)
   String? name;
   @JSONField(name: "AGE")
   int? age;
   UserEntity? child;

  UserEntity();

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      $UserEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
