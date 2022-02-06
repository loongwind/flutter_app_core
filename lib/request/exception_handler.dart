

import 'package:flutter_app_core/request/config.dart';
import 'package:flutter_app_core/request/exception.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

bool handleException(ApiException exception, {bool Function(ApiException)? onError}){

  if(onError?.call(exception) == true){
    return true;
  }

  if(exception.code == 401 ){
    ///todo to login
    return true;
  }
  EasyLoading.showError(exception.message ?? ApiException.unknownException);

  return false;
}