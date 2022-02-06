
import 'package:flutter_app_core/models/login_params.dart';
import 'package:flutter_app_core/models/user_entity.dart';
import 'package:flutter_app_core/request/apis.dart';
import 'package:flutter_app_core/request/request.dart';
import 'package:flutter_app_core/request/request_client.dart';
import 'package:flutter_app_core/service/api_service.dart';
import 'package:flutter_app_core/utils/loading.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class CounterController extends GetxController {
  final CounterState state = CounterState();
  final ApiService apiService = Get.find();

  void increase() {
    state.count += 1;
    update();
  }


  void login(String password) => request(() async {
    LoginParams params = LoginParams();
    params.username = "loongwind";
    params.password = password;
    UserEntity? user = await requestClient.post<UserEntity>(APIS.login, data: params);
    state.user = user;
    update();
  });

  void loginError(bool errorHandler) => request(() async {
    LoginParams params = LoginParams();
    params.username = "loongwind";
    params.password = "654321";
    UserEntity? user = await requestClient.post<UserEntity>(APIS.login, data: params, onError: (e){
      state.errorMessage = "request error : ${e.message}";
      print(state.errorMessage);
      update();
      return errorHandler;
    });
    state.user = user;
    print("-------------${user?.username ?? "登录失败"}");
    update();
  });


  void loginLoading(bool showLoading) => request(() async {
    LoginParams params = LoginParams();
    params.username = "loongwind";
    params.password = "123456";
    UserEntity? user = await requestClient.post<UserEntity>(APIS.login, data: params,  );
    state.user = user;
    update();
  }, showLoading: showLoading);

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
