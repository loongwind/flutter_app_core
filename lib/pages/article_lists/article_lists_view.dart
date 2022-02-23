import 'package:flutter/material.dart';
import 'package:flutter_app_core/components/refresh.dart';
import 'package:flutter_app_core/models/article.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'article_lists_controller.dart';

class ArticleListsPage extends StatelessWidget {
  final controller = Get.find<ArticleListsController>();
  final state = Get.find<ArticleListsController>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("文章列表"),
      ),
      body: buildRefreshListWidget<Article,ArticleListsController>(itemBuilder: (item, index){
        return _buildItem(item);
      }),
    );
  }

  Card _buildItem(Article item) {
    return Card(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.title ?? "", style: const TextStyle(fontSize: 16, color: Colors.black),),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(item.author ?? "",  style: const TextStyle(fontSize: 14, color: Colors.black54),),
                            const SizedBox(width: 15,),
                            Text(item.createTime ?? "", style: const TextStyle(fontSize: 14, color: Colors.black54),),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Text(item.des ?? "", maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, color: Colors.black87),),
                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                  item.cover?.isNotEmpty == true ? Image.network(item.cover ?? "", width: 100, height: 65, fit: BoxFit.cover,) : Container()
                ],
              ),
            ],
          ),
        ),
      );
  }
}
