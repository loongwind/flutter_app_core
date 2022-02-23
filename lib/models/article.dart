import 'dart:convert';

import 'package:flutter_app_core/generated/json/article.g.dart';
import 'package:flutter_app_core/generated/json/base/json_field.dart';
import 'package:flutter_app_core/generated/json/paging_request.g.dart';

@JsonSerializable()
class Article {

	String? title;
	String? des;
	String? createTime;
	String? author;
	String? cover;
	String? url;

	@JSONField(serialize: false)
  int? total;

  Article();

  factory Article.fromJson(Map<String, dynamic> json) => $ArticleFromJson(json);

  Map<String, dynamic> toJson() => $ArticleToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

}
