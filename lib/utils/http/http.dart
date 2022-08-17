import 'dart:convert';

import 'package:http/http.dart' as http;

class SuccessResponse {
  http.Response response;
  Map body;
  get data() {
  }
  SuccessResponse(this.response,this.body);
}

class Fetch {
  Fetch(this.host, this.headers);
  String host;
  Map<String, String> headers;

  Future<SuccessResponse> get(String path, Map<String, String> headers) async {
    var url = '$host$path';
    final response = await http.get(Uri.parse(url), headers: {...this.headers,...headers});
    if (response.statusCode == 200) {
      return SuccessResponse(response,await jsonDecode(response.body));
    } else {
      throw Exception('error');
    }
  }
}
