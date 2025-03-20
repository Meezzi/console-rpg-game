import 'dart:io';
import 'dart:math';
import 'character.dart';
import 'monster.dart';
import '../../utils/input.dart';

class Game {
  Character character;
  List<Monster> monsters;
  int defeatedMonsterCount;

  Game(this.character, this.monsters, this.defeatedMonsterCount);

  // 전투 시작
  Future<bool> battle(Monster monster) async {
    while (true) {
      print('${character.name}의 턴');
      stdout.write('행동을 선택하세요 (1: 공격, 2: 방어): ');

      var input = getUserBattleInput();
    }
  }

  Monster getRandomMonster() {
    Monster monster = monsters[Random().nextInt(monsters.length)];
    return monster;
  }
}
