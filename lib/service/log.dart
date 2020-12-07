import 'dart:io';
import 'dart:convert';
import 'dart:core';

HttpClient httpClient = new HttpClient();

Future<dynamic> getLogList(Map<String, int> params) async {
  // 格式化请求数据
  Map<String, String> temp = params.map<String, String>((k, v) {
    return MapEntry(k, v.toString());
  });

  Uri uri = new Uri.http('192.168.1.123:7002', '/log-list', temp);
  // var uri = 'http://127.0.0.1:7002/log-list';

  HttpClientRequest request = await httpClient.getUrl(uri);

  HttpClientResponse response = await request.close();

  String json = await response.transform(utf8.decoder).join();

  return jsonDecode(json);
}
