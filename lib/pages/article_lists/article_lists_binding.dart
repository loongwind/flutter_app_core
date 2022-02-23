import 'package:flutter_app_core/service/api_service.dart';
import 'package:get/get.dart';

import 'article_lists_controller.dart';

class ArticleListsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleListsController());
    Get.lazyPut(() => ApiService());
  }
}
