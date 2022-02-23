

import 'package:flutter_app_core/models/api_response/paging_data.dart';
import 'package:flutter_app_core/models/article.dart';
import 'package:flutter_app_core/models/login_params.dart';
import 'package:flutter_app_core/models/paging_request.dart';
import 'package:flutter_app_core/models/user_entity.dart';
import 'package:flutter_app_core/request/apis.dart';
import 'package:flutter_app_core/request/request_client.dart';
import 'package:get/get.dart';

class ApiService extends GetxService{


  Future<UserEntity?> login(LoginParams params, {onError}){
    return requestClient.post<UserEntity>(APIS.login, data: params, onError: onError);
  }
  Future<UserEntity?> test(){
    return requestClient.post<UserEntity>(APIS.test);
  }
  
  Future<PagingData<Article>?> getArticleList(PagingParams pagingRequest) async{
    return await requestClient.post<PagingData<Article>>("https://www.fastmock.site/mock/6d5084df89b4c7a49b28052a0f51c29a/test/api/article/list", data: pagingRequest);
  }
}