import 'dart:io';
import '../domain/usecase/monster.dart';

List<Monster> loadMonsterStatsAsync() {
  final file = File('resource/monsters.txt');
  var lines = file.readAsLinesSync();

  List<Monster> monsterList = [];
  for (int i = 0; i < lines.length; i++) {
    monsterList.add(Monster.fromPlainText(lines[i]));
  }
  return monsterList;
}
