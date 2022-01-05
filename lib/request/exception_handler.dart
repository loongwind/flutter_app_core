

import 'package:flutter_app_core/request/exception.dart';
import 'package:get/get.dart';

bool handleException(ApiException exception){
  print("--------${exception.code}");
  if(exception.code == 401 || exception.code == 40009){
    ///todo to login
    return true;
  }
  return false;
}