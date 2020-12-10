import 'dart:io';
import 'dart:convert';
import 'dart:core';

HttpClient httpClient = new HttpClient();

const String HOST = '192.168.43.104';
const int PORT = 7001;

// http请求基础类
class API {
  HttpClient httpClient = new HttpClient();

  Map<String, String> _formatData(Map params) {
    // 格式化请求数据
    Map<String, String> temp = params.map<String, String>((k, v) {
      return MapEntry(k, v.toString());
    });

    return temp;
  }

  // get请求
  Future<dynamic> getData({Map query, String url}) async {
    Uri uri = new Uri.http(HOST + ":" + '$PORT', url, _formatData(query));

    HttpClientRequest request = await httpClient.getUrl(uri);

    HttpClientResponse response = await request.close();

    String json = await response.transform(utf8.decoder).join();

    return jsonDecode(json);
  }

  // delete请求
  Future<dynamic> delete<T>({Map<String, T> query, String url}) async {
    HttpClient httpClient = new HttpClient();

    Uri uri = Uri.http(HOST + ':' + '$PORT', url, _formatData(query));

    HttpClientRequest request = await httpClient.deleteUrl(uri);

    HttpClientResponse response = await request.close();

    String json = await response.transform(utf8.decoder).join();

    return jsonDecode(json);
  }
}

API api = new API();
