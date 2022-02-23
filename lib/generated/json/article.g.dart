import 'package:flutter_app_core/generated/json/base/json_convert_content.dart';
import 'package:flutter_app_core/models/article.dart';

Article $ArticleFromJson(Map<String, dynamic> json) {
	final Article article = Article();
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		article.title = title;
	}
	final String? des = jsonConvert.convert<String>(json['des']);
	if (des != null) {
		article.des = des;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		article.createTime = createTime;
	}
	final String? author = jsonConvert.convert<String>(json['author']);
	if (author != null) {
		article.author = author;
	}
	final String? cover = jsonConvert.convert<String>(json['cover']);
	if (cover != null) {
		article.cover = cover;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		article.url = url;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		article.total = total;
	}
	return article;
}

Map<String, dynamic> $ArticleToJson(Article entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['title'] = entity.title;
	data['des'] = entity.des;
	data['createTime'] = entity.createTime;
	data['author'] = entity.author;
	data['cover'] = entity.cover;
	data['url'] = entity.url;
	return data;
}