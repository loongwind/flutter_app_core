import 'package:flutter_app_core/models/login_params.dart';
import 'package:flutter_app_core/models/user_entity.dart';
import 'package:flutter_app_core/request/request.dart';
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
    testRequest();
    update();
  }


  void testRequest() => request(() async {
    UserEntity? user = await apiService.test();
    print(user?.name);

    user = await apiService.test();
    print(user?.name);
  });

  void login() async{
    LoginParams params = LoginParams();
    ///todo set login params
    await apiService.login(params);
    ///todo success to home
  }

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
