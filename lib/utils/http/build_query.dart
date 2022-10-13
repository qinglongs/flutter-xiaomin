import 'dart:convert';

/// ### 构建url的query参数
/// 1. 数组会转为 array[]=value1 & array[]=value2 的格式
/// 2. 对象会转为 JSON 字符串
/// 3. 其余值类型不做处理
String buildQuery(Map<String, dynamic> params) {
  List<String> keyValuePairStrings = [];
  params.forEach((key, value) {
    if (value is List) {
      for (var item in value) {
        if (item is List || item is Map || item is Set) {
          keyValuePairStrings
              .add('$key[]=${Uri.encodeComponent(jsonEncode(item))}');
        } else {
          keyValuePairStrings.add('$key[]=$item');
        }
      }
    } else if (value is Map || value is List) {
      keyValuePairStrings
          .add('$key[]=${Uri.encodeComponent(jsonEncode(value))}');
    } else {
      keyValuePairStrings.add('$key=$value');
    }
  });
  return keyValuePairStrings.join('&');
}
