import 'package:dio/dio.dart';
import 'package:flutter_app_core/models/api_response/api_response_entity.dart';

class ApiException implements Exception {
  final String? message;
  final int? code;

  ApiException([this.code, this.message]);

  factory ApiException.create(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return BadRequestException(-1, "请求取消");
      case DioErrorType.connectTimeout:
        return BadRequestException(-1, "连接超时");
      case DioErrorType.sendTimeout:
        return BadRequestException(-1, "请求超时");
      case DioErrorType.receiveTimeout:
        return BadRequestException(-1, "响应超时");
      case DioErrorType.response:
        try {
          int? errCode = error.response?.statusCode!;
          ApiResponse apiResponse = ApiResponse.fromJson(error.response?.data);
          if(apiResponse.code != null){
            return ApiException(apiResponse.code, apiResponse.message);
          }
          switch (errCode) {
            case 400:
              return BadRequestException(errCode, "请求语法错误");
            case 401:
              return UnauthorisedException(errCode!, "没有权限");
            case 403:
              return UnauthorisedException(errCode!, "服务器拒绝执行");
            case 404:
              return UnauthorisedException(errCode!, "无法连接服务器");
            case 405:
              return UnauthorisedException(errCode!, "请求方法被禁止");
            case 500:
              return UnauthorisedException(errCode!, "服务器内部错误");
            case 502:
              return UnauthorisedException(errCode!, "无效的请求");
            case 503:
              return UnauthorisedException(errCode!, "服务器异常");
            case 505:
              return UnauthorisedException(errCode!, "不支持HTTP协议请求");
            default:
              print("=========");
              return ApiException(
                  errCode, error.response?.statusMessage ?? '未知错误');
          }
        } on Exception catch (e) {
          print("----------->$e");
          return ApiException(-1, "未知错误");
        }
      default:
        return ApiException(-1, error.message);
    }
  }
}

/// 请求错误
class BadRequestException extends ApiException {
  BadRequestException([int? code, String? message]) : super(code, message);
}

/// 未认证异常
class UnauthorisedException extends ApiException {
  UnauthorisedException([int code = -1, String message = ''])
      : super(code, message);
}
