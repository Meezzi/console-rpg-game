import 'dart:math';
import 'character.dart';

class Monster {
  String name;
  int health;
  int maxAttack;
  int attack = 0;
  int defense = 0;

  Monster(this.name, this.health, this.maxAttack);
  factory Monster.fromPlainText(String content) {
    final stats = content.split(',');

    String name = stats[0].toString();
    int health = int.parse(stats[1]);
    int maxAttack = int.parse(stats[2]);

    return Monster(name, health, maxAttack);
  }

  void attackCharacter(Character character) {
    print('$name이(가) ${character.name}에게 $attack의 데미지를 입혔습니다.');
    character.health -= attack - character.defense;
    attack =
        Random().nextInt(maxAttack - character.defense) + character.defense;
  }

  void showStatus() {
    print('$name - 체력: $health, 공격력: $attack');
  }

  // 몬스터의 방어력 2씩 증가
  void increaseDefense() {
    defense += 2;
  }
}
