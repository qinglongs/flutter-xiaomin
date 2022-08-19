import 'dart:convert';

import 'package:http/http.dart' as http;
import './build_query.dart';

class BaseList<Item> {
  late int page;
  late List<Item> list;
  late int pageSize;
  late int total;
  BaseList(BaseList<Item> data) {
    page = data.page;
    list = data.list;
    pageSize = data.pageSize;
    total = data.total;
  }
}

class BaseResponse<Data> {
  late String code;
  late String message;
  late Data data;
  BaseResponse(BaseResponse<Data> body) {
    code = body.code;
    data = body.data;
    message = body.message;
  }
}

class SuccessResponse<T> {
  http.Response response;
  BaseResponse<T> body;
  SuccessResponse(this.response, this.body);
}

class Fetch {
  Fetch(this.host, this.headers);
  String host;
  Map<String, String> headers;

  Future<SuccessResponse<T>> get<T>(String path,
      {Map<String, String> headers = const {},
      Map<String, dynamic> params = const {}}) async {
    var url = '$host$path';
    final response = await http.get(Uri.parse('$url?${buildQuery(params)}'),
        headers: {...this.headers, ...headers});
    if (response.statusCode == 200) {
      return SuccessResponse<T>(response, await jsonDecode(response.body));
    } else {
      throw Exception('error');
    }
  }
}

final fetchClient = Fetch('http://1.116.95.44:3000/mock/1058',
    {'Content-Type': 'application/json', 'Authorization': ''});
