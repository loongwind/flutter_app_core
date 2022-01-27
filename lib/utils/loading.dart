

import 'package:flutter_easyloading/flutter_easyloading.dart';

Future loading( Function block, {bool isShowLoading = true}) async{
  if (isShowLoading) {
    showLoading();
  }
  try {
    await block();
  } catch (e) {
    rethrow;
  } finally {
    dismissLoading();
  }
  return;
}


void showLoading(){
  EasyLoading.show(status: "加载中...");
}

void dismissLoading(){
  EasyLoading.dismiss();
}