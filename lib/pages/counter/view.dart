import 'package:flutter/material.dart';
import 'package:flutter_app_core/res/string_res/str_res_keys.dart';
import 'package:get/get.dart';

import 'controller.dart';

class CounterPage extends StatelessWidget {
  final controller = Get.find<CounterController>();
  final state = Get.find<CounterController>().state;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        child: GetBuilder<CounterController>(builder: (controller) {
          return Text("${SR.hello.tr} : ${state.count}", style: const TextStyle(fontSize: 50),);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => controller.increase(),
      ),
    );
  }
}
