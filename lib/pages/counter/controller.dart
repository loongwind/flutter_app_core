import 'package:flutter_app_core/models/login_params.dart';
import 'package:flutter_app_core/service/api_service.dart';
import 'package:get/get.dart';

import 'state.dart';

class CounterController extends GetxController {
  final CounterState state = CounterState();
  final ApiService apiService = Get.find();

  void increase() {
    state.count += 1;
    update();
  }

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
