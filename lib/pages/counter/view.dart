import 'package:flutter/material.dart';
import 'package:flutter_app_core/res/string_res/str_res_keys.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller.dart';

class CounterPage extends StatelessWidget {
  final controller = Get.find<CounterController>();
  final state = Get.find<CounterController>().state;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height
    ),
    designSize: const Size(360, 690),
    orientation: Orientation.portrait);
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        child: GetBuilder<CounterController>(builder: (controller) {
          return Text("${SR.hello.tr} : ${state.count}", style: TextStyle(fontSize: 50.sp),);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => controller.increase(),
      ),
    );
  }
}
