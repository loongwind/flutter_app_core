import 'package:flutter_app_core/base/page_controller.dart';
import 'package:flutter_app_core/models/api_response/paging_data.dart';
import 'package:flutter_app_core/models/article.dart';
import 'package:flutter_app_core/models/paging_request.dart';
import 'package:flutter_app_core/service/api_service.dart';
import 'package:get/get.dart';

import 'article_lists_state.dart';

class ArticleListsController extends PagingController<Article, ArticleListsState> {
  final ArticleListsState state = ArticleListsState();
  final ApiService apiService = Get.find();


  @override
  ArticleListsState getState() => ArticleListsState();

  @override
  Future<PagingData<Article>?> loadData(PagingParams pagingParams) async{
    PagingData<Article>? articleList = await apiService.getArticleList(pagingParams);
    return articleList;
  }
}
