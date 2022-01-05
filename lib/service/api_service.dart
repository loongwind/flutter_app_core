

import 'package:flutter_app_core/models/login_params.dart';
import 'package:flutter_app_core/models/user_entity.dart';
import 'package:flutter_app_core/request/apis.dart';
import 'package:flutter_app_core/request/request_client.dart';
import 'package:get/get.dart';

class ApiService extends GetxService{


  Future<UserEntity?> login(LoginParams params, {onError}){
    return request.post<UserEntity>(APIS.login, data: params, onError: onError);
  }
}