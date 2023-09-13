import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:task_manager/task_manager_app.dart';

main() async {
  await GetStorage.init();
  runApp(const TaskManager());
}
