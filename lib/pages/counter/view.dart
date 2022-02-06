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
    context: Get.context,
    orientation: Orientation.portrait);
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: GetBuilder<CounterController>(builder: (controller) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("${SR.hello.tr} : ${state.count}", style: TextStyle(fontSize: 50.sp),),
              ElevatedButton(onPressed: () => controller.login("123456"), child: const Text("正常登录")),
              ElevatedButton(onPressed: () => controller.login("654321"), child: const Text("错误登录")),
              Text("登录用户：${state.user?.username ?? ""}", style: TextStyle(fontSize: 20.sp),),
              ElevatedButton(onPressed: () => controller.loginError(false), child: const Text("异常处理 返回 false")),
              ElevatedButton(onPressed: () => controller.loginError(true), child: const Text("异常处理 返回 true")),
              Text("错误信息：${state.errorMessage ?? ""}", style: TextStyle(fontSize: 20.sp),),
              ElevatedButton(onPressed: () => controller.loginLoading(true), child: const Text("显示loading")),
              ElevatedButton(onPressed: () => controller.loginLoading(false), child: const Text("不显示loading")),

            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => controller.increase(),
      ),
    );
  }
}
