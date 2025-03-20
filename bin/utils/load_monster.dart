import 'dart:io';
import '../domain/usecase/monster.dart';

List<Monster> loadMonsterStatsAsync() {
  try {
    final file = File('resource/monsters.txt');
    var lines = file.readAsLinesSync();

    List<Monster> monsterList = [];
    for (int i = 0; i < lines.length; i++) {
      monsterList.add(Monster.fromPlainText(lines[i]));
      print(monsterList[i].attack);
    }
    return monsterList;
  } on PathNotFoundException {
    throw ('파일의 지정된 경로를 찾을 수 없습니다.');
  } catch (e) {
    throw ('몬스터 데이터를 불러오는 데 실패했습니다: $e');
  }
}
