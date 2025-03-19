import 'dart:io';

String? getUserInput() {
  return stdin.readLineSync();
}

String getUserName() {
  RegExp regexp = RegExp(r'^[a-zA-Z가-힣\s]+$');

  stdout.write('캐릭터의 이름을 입력하세요: ');
  String? name = stdin.readLineSync();

  if (name != null && regexp.hasMatch(name)) {
    return name;
  }
  return '';
}
