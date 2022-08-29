import 'package:flutter_xiaomin/utils/http/http.dart';

class GoalsType {
  late String name;
  late String id;
  late int sort;
}

/// ### 获取目标类型选项
Future<SuccessResponse<List<GoalsType>>> getGoalTypesOptions() {
  return manageFetch.get<List<GoalsType>>('/api/v1/manage/goal-types');
}
