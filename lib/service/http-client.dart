import 'dart:io';
import 'dart:convert';
import 'dart:core';
import '../components/show-action/show-action.dart';

const String HOST = '192.168.43.104:7001';

// http请求基础类
class API {
  HttpClient _httpClient = new HttpClient();

  // 这是一个工具函数，用来格式化请求参数，将Map<String,dynamic> 转换成 Map<String,String>
  Map<String, String> _formatData(Map params) {
    if (params == null) return {};
    // 格式化请求数据
    Map<String, String> temp = params.map<String, String>((k, v) {
      return MapEntry(k, v.toString());
    });

    return temp;
  }

  // get请求
  Future<dynamic> getData({Map query, String url}) async {
    Uri uri = new Uri.http(HOST, url, _formatData(query));

    HttpClientRequest request = await _httpClient.getUrl(uri);

    HttpClientResponse response = await request.close();

    String json = await response.transform(utf8.decoder).join();

    return jsonDecode(json);
  }

  // delete请求
  Future<dynamic> delete<T>(
      {Map<String, T> query, String url, Map<String, String> headers}) async {
    Uri uri = Uri.http(HOST, url, _formatData(query));

    HttpClientRequest request = await _httpClient.deleteUrl(uri);

    HttpClientResponse response = await request.close();

    String json = await response.transform(utf8.decoder).join();

    return jsonDecode(json);
  }

  // post请求
  Future<dynamic> post<T>(
      {Map<String, T> data, String url, Map<String, String> headers}) async {
    Uri uri = Uri.http(HOST, url);

    HttpClientRequest request = await _httpClient.postUrl(uri);

    HttpClientResponse response = await request.close();

    String json = await response.transform(utf8.decoder).join();

    return jsonDecode(json);
  }

  /// 公共http请求方法
  Future<dynamic> fetch(String method, String url,
      {Map<String, dynamic> query, Map<String, dynamic> data}) async {
    Uri uri = Uri.http(HOST, url, _formatData(query));

    HttpClientRequest request = await _httpClient.openUrl(method, uri);

    if ((method == 'POST' || method == 'DELETE') && data != null) {
      // 配置请求头
      request.headers.contentType =
          new ContentType('application', 'json', charset: 'utf-8');
    }
    // 如果需要传递实体参数
    if (data != null) {
      request.add(utf8.encode(jsonEncode(data)));
    }

    HttpClientResponse response = await request.close();

    String json = await response.transform(utf8.decoder).join();
    if (response.statusCode == HttpStatus.ok) {
      return jsonDecode(json);
    } else {
      actionSheet.showToast(msg: '请求出错了，请联系管理员');
    }
  }
}

API api = new API();
