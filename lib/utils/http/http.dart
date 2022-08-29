import 'dart:convert';

import 'package:http/http.dart' as http;
import './build_query.dart';

abstract class BaseList<Item> {
  late int page;
  late List<Item> list;
  late int pageSize;
  late int total;
}

abstract class BaseResponse<Data> {
  late int code;
  late String message;
  late Data data;
}

class SuccessResponse<T> {
  // 整个请求的响应数据
  http.Response response;

  /// #### 响应数据的body,已经进行jsonDecode
  late BaseResponse<T> body;
  SuccessResponse(this.response) {
    Future<BaseResponse<T>> future = jsonDecode(response.body);
    future.then((value) => {body = value}).catchError((err) {
      throw Exception('json decode body err');
    });
  }

  /// #### 响应数据的data
  T get data => body.data;

  /// #### 响应数据的message
  String get message => body.message;

  /// #### 响应数据的code
  int get code => body.code;
}

class Fetch {
  Fetch(this.host, this.headers);
  String host;
  Map<String, String> headers;

  String getUrl(String path) {
    return '$host$path';
  }

  /// 合并默认的headers和传入的headers
  Map<String, String> getMergedHeaders(Map<String, String> headers) {
    return {...this.headers, ...headers};
  }

  Future<SuccessResponse<T>> get<T>(String path,
      {Map<String, String> headers = const {},
      Map<String, dynamic> params = const {}}) async {
    var url = '${getUrl(path)}?${buildQuery(params)}';
    final response =
        await http.get(Uri.parse(url), headers: getMergedHeaders(headers));
    if (response.statusCode == 200) {
      return SuccessResponse<T>(response);
    } else {
      throw Exception('error');
    }
  }

  Future<SuccessResponse<T>> post<T>(String path,
      {Map<String, String> headers = const {},
      Map<String, dynamic> params = const {}}) async {
    var url = getUrl(path);
    final response = await http.post(Uri.parse(url),
        headers: getMergedHeaders(headers), body: params);
    if (response.statusCode == 200) {
      return SuccessResponse<T>(response);
    } else {
      throw Exception('error');
    }
  }
}

final manageFetch = Fetch('http://1.116.95.44:3000/mock/1058',
    {'Content-Type': 'application/json', 'Authorization': ''});
