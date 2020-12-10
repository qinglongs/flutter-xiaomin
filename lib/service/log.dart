import './http-client.dart';

// 获取日志列表
Future<dynamic> getLogList(Map<String, int> params) async {
  return api.getData(
    url: '/log-list',
    query: params,
  );
}

//删除某一条日志
Future<dynamic> deleteLog(Map<String, String> params) {
  return api.delete<String>(url: '/log-list', query: params);
}
