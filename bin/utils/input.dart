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

// 전투할 때 캐릭터의 입력을 1 또는 2, 3만 반환
String getUserBattleInput() {
  while (true) {
    String? input = stdin.readLineSync();

    if (input == '1' || input == '2' || input == '3') {
      return input!;
    } else {
      print('다시 입력해주세요.');
    }
  }
}

// 다음 전투를 계속 할지 입력
bool isContinueNextBattle() {
  while (true) {
    String? input = getUserInput();

    switch (input) {
      case 'y':
        return true;
      case 'n':
        return false;
      default:
        print('다시 입력해주세요.');
    }
  }
}
