import 'package:flutter/foundation.dart';   

class ApiConfig {
  ApiConfig._();

  static const String lanhost = '10.102.22.144';
  static const int port = 5099;

  static String get baseurl {
    if (kIsWeb) return 'https://185.140.181.252/kanban/';
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
        return 'http://$lanhost:$port';
      default:
        return 'http://localhost:$port';
    }
  }

  static String get tasksurl => '$baseurl/api/tasks';

  static String taskurl(String taskid) => '$baseurl/api/tasks/$taskid';

  static String subtasksurl(String taskid) =>
      '$baseurl/api/tasks/$taskid/subtasks';

  static String subtaskurl(String taskid, String subtaskid) =>
      '$baseurl/api/tasks/$taskid/subtasks/$subtaskid';
}
