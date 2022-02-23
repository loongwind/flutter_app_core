import 'package:flutter_app_core/generated/json/base/json_convert_content.dart';
import 'package:flutter_app_core/models/api_response/api_response_entity.dart';
import 'package:flutter_app_core/models/api_response/paging_data.g.dart';

ApiResponse<T> $ApiResponseFromJson<T>(Map<String, dynamic> json) {
	final ApiResponse<T> apiResponseEntity = ApiResponse<T>();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		apiResponseEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		apiResponseEntity.message = message;
	}
	String type = T.toString();
	T? data;
	print("type:$type");
	if(json['data'] != null){
		if(type.startsWith("PagingData<")){
			data = pagingDataFromJsonSingle<T>(json['data']);
		}else{
			data = jsonConvert.convert<T>(json['data']);
		}
	}
	if (data != null) {
		apiResponseEntity.data = data;
	}
	return apiResponseEntity;
}

Map<String, dynamic> $ApiResponseToJson(ApiResponse entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data;
	return data;
}