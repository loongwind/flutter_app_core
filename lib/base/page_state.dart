
class PagingState<T>{
  /// 分页的页数
  int pageIndex = 1;
  ///是否还有更多数据
  bool hasMore = true;

  /// 用于列表刷新的id
  Object refreshId = Object();

  /// 列表数据
  List<T> data = <T>[];

}