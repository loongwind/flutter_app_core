import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_app_core/models/api_response/api_response_entity.dart';
import 'package:flutter_app_core/request/apis.dart';
import 'package:flutter_app_core/request/config.dart';
import 'package:flutter_app_core/request/exception.dart';
import 'package:flutter_app_core/request/exception_handler.dart';
import 'package:flutter_app_core/request/token_interceptor.dart';
import 'package:flutter_app_core/utils/type_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

_RequestClient request = _RequestClient();

class _RequestClient {
  late Dio _dio;

  _RequestClient() {
    _dio = Dio(
        BaseOptions(baseUrl: APIS.baseUrl, connectTimeout: RC.connectTimeout));
    _dio.interceptors.add(TokenInterceptor());
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true, requestBody: true, responseHeader: true));
  }

  Future<T?> request<T>(
    String url, {
    String method = "Get",
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    bool Function(ApiException)? onError,
  }) async {
    try {
      if (showLoading) {
        EasyLoading.show(status: "加载中...");
      }
      Options options = Options()
        ..method = method
        ..headers = headers;

      data = _convertData(data);

      Response response = await _dio.request(url,
          queryParameters: queryParameters, data: data, options: options);
      return _handleRequestResponse<T>(response, onError);
    } on DioError catch (e) {
      var exception = ApiException.create(e);
      print("DioError : ${exception.code}");
      _callError(onError, exception);
    } catch (e) {
      var exception = ApiException(-1, RC.unknownException);
      _callError(onError, exception);
    } finally {
      EasyLoading.dismiss();
    }

    return null;
  }

  _convertData(data) {
     if (data != null && !isBaseType(data) && data is! Map) {
      if(data is List){
        data = data.map((e){
          if(isBaseType(e)){
            return e;
          }
          return jsonDecode(e.toString());
        }).toList();
      }else{
        data = jsonDecode(data.toString());
      }
    }
    return data;
  }

  Future<T?> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    bool Function(ApiException)? onError,
  }) {
    return request(url,
        queryParameters: queryParameters,
        headers: headers,
        showLoading: showLoading,
        onError: onError);
  }

  Future<T?> post<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    bool Function(ApiException)? onError,
  }) {
    return request(url,
        method: "POST",
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        showLoading: showLoading,
        onError: onError);
  }

  Future<T?> delete<T>(
      String url, {
        Map<String, dynamic>? queryParameters,
        data,
        Map<String, dynamic>? headers,
        bool showLoading = true,
        bool Function(ApiException)? onError,
      }) {
    return request(url,
        method: "DELETE",
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        showLoading: showLoading,
        onError: onError);
  }

  Future<T?> put<T>(
      String url, {
        Map<String, dynamic>? queryParameters,
        data,
        Map<String, dynamic>? headers,
        bool showLoading = true,
        bool Function(ApiException)? onError,
      }) {
    return request(url,
        method: "PUT",
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        showLoading: showLoading,
        onError: onError);
  }

  ///请求响应内容处理
  T? _handleRequestResponse<T>(
      Response response, bool Function(ApiException)? onError) {
    if (response.statusCode == 200) {
      ApiResponse<T> apiResponse = ApiResponse<T>.fromJson(response.data);
      return _handleBusinessResponse<T>(apiResponse, onError);
    } else {
      var exception = ApiException(response.statusCode, RC.unknownException);
      _callError(onError, exception);
    }
    return null;
  }

  ///业务内容处理
  T? _handleBusinessResponse<T>(
      ApiResponse<T> response, bool Function(ApiException)? onError) {
    if (response.code == RC.successCode) {
      return response.data;
    } else {
      var exception = ApiException(response.code, response.message);
      _callError(onError, exception);
    }
    return null;
  }

  ///错误回调
  void _callError(bool Function(ApiException)? onError, ApiException exception) {
    if (!(onError != null && onError(exception)) && !handleException(exception)) {
      EasyLoading.showError(exception.message ?? RC.unknownException);
    }
  }
}
