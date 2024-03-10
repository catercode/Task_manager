import 'package:flutter/material.dart';

import 'package:task_manager/presentation/widget/build_text_components.dart';

import 'dart:math';

unfocus(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

String generateId() {
  const String charset =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

  Random random = Random();
  List<String> idList =
      List.generate(10, (index) => charset[random.nextInt(charset.length)]);
  return idList.join();
}
