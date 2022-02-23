
import 'package:flutter_app_core/base/page_state.dart';
import 'package:flutter_app_core/models/api_response/paging_data.dart';
import 'package:flutter_app_core/models/paging_request.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class PagingController<M,S extends PagingState<M>> extends GetxController{

  /// PagingState
  late S pagingState;
  /// 刷新控件的 Controller
  RefreshController refreshController =  RefreshController();

  @override
  void onInit() {
    super.onInit();
    /// 保存 State
    pagingState = getState();
  }

  @override
  void onReady() {
    super.onReady();
    /// 进入页面刷新数据
    refreshData();
  }


  /// 刷新数据
  void refreshData() async{
    initPaging();
    await _loadData();
    /// 刷新完成
    refreshController.refreshCompleted();
  }

  ///初始化分页数据
  void initPaging() {
    pagingState.pageIndex = 1;
    pagingState.hasMore = true;
    pagingState.data.clear();
  }

  /// 数据加载
  Future<List<M>?> _loadData() async {
    PagingParams pagingParams = PagingParams.create(pageIndex: pagingState.pageIndex);
    PagingData<M>? pagingData = await loadData(pagingParams);
    List<M>? list = pagingData?.data;

    /// 数据不为空，则将数据添加到 data 中
    /// 并且分页页数 pageIndex + 1
    if (list != null && list.isNotEmpty) {
      pagingState.data.addAll(list);
      pagingState.pageIndex += 1;
    }

    /// 判断是否有更多数据
    pagingState.hasMore = pagingState.data.length < (pagingData?.total ?? 0);

    /// 更新界面
    update([pagingState.refreshId]);
    return list;
  }


  /// 加载更多
  void loadMoreData() async{
    await _loadData();
    /// 加载完成
    refreshController.loadComplete();
  }

  /// 最终加载数据的方法
  Future<PagingData<M>?> loadData(PagingParams pagingParams);

  /// 获取 State
  S getState();

}