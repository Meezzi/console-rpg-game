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

      // 사용자 입력에 따른 공격과 방어
      // getUserBattleInput()을 통해 1과 2만 입력값으로 넘기기 때문에 default는 하지 않음
      var input = getUserBattleInput();
      switch (input) {
        case '1':
          character.attackMonster(monster);
          break;
        case '2':
          character.defend(monster);
          break;
      }
      print('');
    }
  }

  Monster getRandomMonster() {
    Monster monster = monsters[Random().nextInt(monsters.length)];
    return monster;
  }
}
