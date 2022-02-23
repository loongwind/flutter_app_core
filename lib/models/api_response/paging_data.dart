import 'dart:convert';

import 'package:flutter_app_core/models/api_response/paging_data.g.dart';

class PagingData<T> {

	int? current;
	bool? hitCount;
	int? pages;
	List<T>? data;
	bool? searchCount;
	int? size;
	int? total;
  
  PagingData();

  factory PagingData.fromJson(Map<String, dynamic> json) => $PagingDataFromJson<T>(json);

  Map<String, dynamic> toJson() => $PagingDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

}