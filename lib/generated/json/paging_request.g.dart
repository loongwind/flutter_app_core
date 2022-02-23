import 'package:flutter_app_core/generated/json/base/json_convert_content.dart';
import 'package:flutter_app_core/models/paging_request.dart';

PagingParams $PagingParamsFromJson(Map<String, dynamic> json) {
	final PagingParams pagingParams = PagingParams();
	final int? current = jsonConvert.convert<int>(json['current']);
	if (current != null) {
		pagingParams.current = current;
	}
	final Map<String, dynamic>? extra = jsonConvert.convert<Map<String, dynamic>>(json['extra']);
	if (extra != null) {
		pagingParams.extra = extra;
	}
	final Map<String, dynamic>? model = jsonConvert.convert<Map<String, dynamic>>(json['model']);
	if (model != null) {
		pagingParams.model = model;
	}
	final String? order = jsonConvert.convert<String>(json['order']);
	if (order != null) {
		pagingParams.order = order;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		pagingParams.size = size;
	}
	final String? sort = jsonConvert.convert<String>(json['sort']);
	if (sort != null) {
		pagingParams.sort = sort;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		pagingParams.total = total;
	}
	return pagingParams;
}

Map<String, dynamic> $PagingParamsToJson(PagingParams entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['current'] = entity.current;
	data['extra'] = entity.extra;
	data['model'] = entity.model;
	data['order'] = entity.order;
	data['size'] = entity.size;
	data['sort'] = entity.sort;
	return data;
}