import 'package:get/get.dart';

import 'article_details_state.dart';

class ArticleDetailsController extends GetxController {
  final ArticleDetailsState state = ArticleDetailsState();

  @override
  void onInit() {
    super.onInit();
    state.article = Get.arguments["article"];
  }

}
