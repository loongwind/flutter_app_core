import 'dart:convert';

import 'package:flutter_app_core/generated/json/base/json_field.dart';
import 'package:flutter_app_core/generated/json/paging_request.g.dart';

@JsonSerializable()
class PagingParams {

	int current = 1;
  Map<String, dynamic>? extra = {};
	Map<String, dynamic> model = {};
	String? order = 'descending';
	int size = 10;
	String? sort = "id";

	@JSONField(serialize: false)
  int? total;
  
  PagingParams();

  factory PagingParams.fromJson(Map<String, dynamic> json) => $PagingParamsFromJson(json);

  Map<String, dynamic> toJson() => $PagingParamsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  factory PagingParams.create({required int pageIndex, int pageSize = 10,Map<String, dynamic>? model}){
    var request = PagingParams();
    request.current = pageIndex;
    request.size = pageSize;
    request.model = model ?? {};
    return request;
  }
}
