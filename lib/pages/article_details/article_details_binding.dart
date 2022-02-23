import 'package:get/get.dart';

import 'article_details_controller.dart';

class ArticleDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleDetailsController());
  }
}
