import 'dart:io';
import 'dart:math';
import 'character.dart';
import 'monster.dart';
import '../../utils/input.dart';

class Game {
  Character character;
  List<Monster> monsters;
  int defeatedMonsterCount = 0;

  //Game 생성자
  Game(this.character, this.monsters);

  Future<void> startGame() async {
    print('게임을 시작합니다!');
    // 캐릭터 상태 표시
    character.showStatus();
    print('');

    // 턴 시작 전 1초 대기
    await Future.delayed(Duration(milliseconds: 1000));

    while (true) {
      print('새로운 몬스터가 나타났습니다!');

      // 몬스터 리스트에서 랜덤으로 몬스터 선택
      Monster monster = getRandomMonster();

      // 몬스터의 공격력을 랜덤으로 설정
      monster.attack =
          Random().nextInt(monster.maxAttack - character.defense) +
          character.defense;
    }
  }

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

      // 몬스터의 체력이 0 미만일 경우, 전투 종료
      if (monster.health < 0) {
        return true;
      }

      // 캐릭터의 턴이 끝난 후, 몬스터의 턴이 오기 전 1초 대기
      await Future.delayed(Duration(milliseconds: 1000));

      // 몬스터가 캐릭터 공격
      print('${monster.name}의 턴');
      monster.attackCharacter(character);

      // 캐릭터와 몬스터 상태 표시
      character.showStatus();
      monster.showStatus();
      print('');

      // 모든 턴이 끝난 후 1초 대기
      await Future.delayed(Duration(milliseconds: 1000));

      // 캐릭터의 체력이 0 미만이면, 전투 종료
      if (character.health < 0) {
        return false;
      }
    }
  }

  Monster getRandomMonster() {
    Monster monster = monsters[Random().nextInt(monsters.length)];
    return monster;
  }
}
