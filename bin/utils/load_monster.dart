import 'dart:io';
import '../domain/usecase/monster.dart';

List<Monster> loadMonsterStatsAsync() {
  final file = File('resource/monsters.txt');
  var lines = file.readAsLinesSync();

  return [];
}
