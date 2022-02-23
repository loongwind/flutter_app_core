import 'package:flutter/material.dart';
import 'package:flutter_app_core/base/page_controller.dart';
import 'package:flutter_app_core/base/page_state.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Widget buildRefreshWidget({
  required Widget Function() builder,
  VoidCallback? onRefresh,
  VoidCallback? onLoad,
  required RefreshController refreshController,
  bool enablePullUp = true,
  bool enablePullDown = true
}) {
  return SmartRefresher(
    enablePullUp: enablePullUp,
    enablePullDown: enablePullDown,
    controller: refreshController,
    onRefresh: onRefresh,
    onLoading: onLoad,
    header: const ClassicHeader(idleText: "下拉刷新",
      releaseText: "松开刷新",
      completeText: "刷新完成",
      refreshingText: "加载中......",),
    footer: const ClassicFooter(idleText: "上拉加载更多",
      canLoadingText: "松开加载更多",
      loadingText: "加载中......",),
    child: builder(),
  );
}


Widget buildRefreshListWidget<T, C extends PagingController<T, PagingState<T>>>(
    {
      required Widget Function(T item, int index) itemBuilder,
      bool enablePullUp = true,
      bool enablePullDown = true,
      String? tag,
      Widget Function(T item, int index)? separatorBuilder,
      Function(T item, int index)? onItemClick,
      ScrollPhysics? physics,
      bool shrinkWrap = false,
      Axis scrollDirection = Axis.vertical
    }) {
  C controller = Get.find(tag: tag);
  return GetBuilder<C>(builder: (controller) {
    return buildRefreshWidget(
        builder: () =>
            buildListView<T>(
                data: controller.pagingState.data,
                separatorBuilder: separatorBuilder,
                itemBuilder: itemBuilder,
                onItemClick: onItemClick,
                physics: physics,
                shrinkWrap: shrinkWrap,
                scrollDirection: scrollDirection
            ),
        refreshController: controller.refreshController,
        onRefresh: controller.refreshData,
        onLoad: controller.loadMoreData,
        enablePullDown: enablePullDown,
        enablePullUp: enablePullUp && controller.pagingState.hasMore,
    );
  }, tag: tag, id: controller.pagingState.refreshId,);
}


Widget buildListView<T>(
    {required Widget Function(T item, int index) itemBuilder,
    required List<T> data,
    Widget Function(T item, int index)? separatorBuilder,
    Function(T item, int index)? onItemClick,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    Axis scrollDirection = Axis.vertical}) {
  return ListView.separated(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: EdgeInsets.zero,
      scrollDirection: scrollDirection,
      itemBuilder: (ctx, index) => GestureDetector(
            child: itemBuilder.call(data[index], index),
            onTap: () => onItemClick?.call(data[index], index),
          ),
      separatorBuilder: (ctx, index) =>
          separatorBuilder?.call(data[index], index) ?? Container(),
      itemCount: data.length);
}
