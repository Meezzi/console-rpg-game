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
    print('');
    // 30% 확률로 캐릭터 체력 회복
    if (Random().nextInt(100) <= 30) {
      character.heal();
    }

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

      // 몬스터 상태 표시
      monster.showStatus();
      print('');

      // 몬스터와 전투 후, 결과 저장
      bool battleResult = await battle(monster);

      // 결과가 true이면 몬스터 리스트에서 해당 몬스터 삭제
      // 물리친 몬스터 수 1 증가
      // 결과가 false라면 게임 종료
      if (battleResult) {
        print('${monster.name}을(를) 물리쳤습니다!');
        print('');
        monsters.remove(monster);
        defeatedMonsterCount++;
      } else {
        print('도전에 실패했습니다.');
        return;
      }
      // 몬스터 리스트가 비어있지 않으면 다음 전투 여부 확인
      if (monsters.isNotEmpty) {
        stdout.write('다음 몬스터와 싸우시겠습니까? (y/n): ');

        // 입력이 n 이라면(전투를 하고 싶지 않다면) 결과 저장 여부 확인 후, 게임 종료
        // 입력이 y 라면 전투 지속
        if (!isContinueNextBattle()) {
          stdout.write('결과를 저장하시겠습니까? ');
          if (isContinueNextBattle()) {
            saveGame(character, monsters, false);
          }
          print('게임을 종료합니다.');
          return;
        }
      } else {
        // 몬스터 리스트가 비어있다면 게임 종료
        // 결과 저장 여부 확인 후, 결과 저장
        print('축하합니다! 모든 몬스터를 물리쳤습니다.\n');
        stdout.write('결과를 저장하시겠습니까? (y/n): ');
        if (isContinueNextBattle()) {
          saveGame(character, monsters, true);
        }
        return;
      }
      print('');
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

      // 몬스터의 체력이 0 이하일 경우, 전투 종료
      if (monster.health <= 0) {
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

      // 캐릭터의 체력이 0 이하면, 전투 종료
      if (character.health <= 0) {
        return false;
      }
    }
  }

  Monster getRandomMonster() {
    Monster monster = monsters[Random().nextInt(monsters.length)];
    return monster;
  }

  // 결과를 resource/result.txt 파일에 저장
  void saveGame(Character character, List<Monster> monster, bool gameResult) {
    // Character의 정보를 변수에 저장
    String characterData =
        '${character.name}, ${character.health}, $gameResult';

    // Monster의 정보를 저장할 변수 선언
    String monsterData = '';

    // 전투를 진행하지 않은 몬스터가 있다면 몬스터의 데이터 저장
    if (monster.isNotEmpty) {
      for (int i = 0; i < monster.length; i++) {
        monsterData +=
            '${monster[i].name}, ${monster[i].health}, ${monster[i].attack}, ${monster[i].defense}, ${monster[i].maxAttack}\n';
      }
    }

    // Character 정보와 Monster 정보를 resource/result.txt 파일에 저장
    String contents = '$characterData\n$monsterData';
    File('resource/result.txt').writeAsStringSync(contents);
  }
}
