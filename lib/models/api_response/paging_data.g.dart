

import 'package:flutter_app_core/generated/json/base/json_convert_content.dart';
import 'package:flutter_app_core/models/api_response/paging_data.dart';
import 'package:flutter_app_core/models/article.dart';

PagingData<T> $PagingDataFromJson<T>(Map<String, dynamic> json) {
	final PagingData<T> pagingData = PagingData<T>();
	final int? current = jsonConvert.convert<int>(json['current']);
	if (current != null) {
		pagingData.current = current;
	}
	final bool? hitCount = jsonConvert.convert<bool>(json['hitCount']);
	if (hitCount != null) {
		pagingData.hitCount = hitCount;
	}
	final int? pages = jsonConvert.convert<int>(json['pages']);
	if (pages != null) {
		pagingData.pages = pages;
	}
	final List<T>? records = jsonConvert.convertListNotNull<T>(json['data']);
	if (records != null) {
		pagingData.data = records;
	}
	final bool? searchCount = jsonConvert.convert<bool>(json['searchCount']);
	if (searchCount != null) {
		pagingData.searchCount = searchCount;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		pagingData.size = size;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		pagingData.total = total;
	}
	return pagingData;
}

Map<String, dynamic> $PagingDataToJson(PagingData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['current'] = entity.current;
	data['hitCount'] = entity.hitCount;
	data['pages'] = entity.pages;
	data['records'] =  entity.data;
	data['searchCount'] = entity.searchCount;
	data['size'] = entity.size;
	data['total'] = entity.total;
	return data;
}


M? pagingDataFromJsonSingle<M>(Map<String, dynamic> json){
		String type = M.toString();
		String genericType = type.substring(type.indexOf("<") + 1, type.length -1);
		print("genericType :$genericType");
		if((Article).toString() == genericType){
			PagingData<Article> pagingData = PagingData<Article>.fromJson(json);
			return pagingData as M;
		}

		return PagingData.fromJson(json) as M;
}