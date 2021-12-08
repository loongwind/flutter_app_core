import 'package:get/get.dart';

import 'state.dart';

class CounterController extends GetxController {
  final CounterState state = CounterState();

  void increase() {
    state.count += 1;
    update();
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
