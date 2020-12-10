import './http-client.dart';

// 获取日志列表
Future<dynamic> getLogList(Map<String, int> params) async {
  return api.fetch('GET', '/log-list', query: params);
}

//删除某一条日志
Future<dynamic> deleteLog(Map<String, int> params) {
  return api.fetch('DELETE', '/log-list', data: params);
}
