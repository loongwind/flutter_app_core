

import 'package:flutter_app_core/request/config.dart';
import 'package:flutter_app_core/request/exception.dart';
import 'package:flutter_app_core/request/exception_handler.dart';
import 'package:flutter_app_core/utils/loading.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future request(Function() block,  {bool showLoading = true, bool Function(ApiException)? onError, }) async{
  try {
    await loading(block, isShowLoading:  showLoading);
  } catch (e) {
    handleException(ApiException.from(e), onError: onError);
  }
  return;
}