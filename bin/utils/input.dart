import 'dart:io';

String? getUserInput() {
  return stdin.readLineSync();
}

String getUserName() {
  RegExp regexp = RegExp(r'^[a-zA-Z가-힣\s]+$');

  return '';
}
