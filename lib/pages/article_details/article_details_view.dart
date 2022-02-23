import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'article_details_controller.dart';

class ArticleDetailsPage extends StatelessWidget {
  final controller = Get.find<ArticleDetailsController>();
  final state = Get.find<ArticleDetailsController>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(state.article?.title ?? ""),
      ),
      body: WebView(
        initialUrl: state.article?.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
