import 'dart:io';

String? getUserInput() {
  return stdin.readLineSync();
}

String getUserName() {
  RegExp regexp = RegExp(r'^[a-zA-Z가-힣\s]+$');

  while (true) {
    stdout.write('캐릭터의 이름을 입력하세요: ');
    String? name = stdin.readLineSync();

    if (name != null && regexp.hasMatch(name)) {
      return name;
    } else {
      print('이름에는 특수문자나 숫자를 포함할 수 없습니다.');
    }
  }
}
