
import 'package:flutter_app_core/res/string_res/str_res_en.dart';
import 'package:flutter_app_core/res/string_res/str_res_zh.dart';
import 'package:get/get.dart';

class StringRes extends Translations{

  @override
  Map<String, Map<String, String>> get keys => {
    'zh_CN': zh_CN_res,
    'en_US':en_US_res
  };

}