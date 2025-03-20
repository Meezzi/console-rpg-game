import 'monster.dart';

class Character {
  String name;
  int health;
  int attack;
  int defense;

  Character(this.name, this.health, this.attack, this.defense);
  factory Character.fromPlainText(String name, String content) {
    final stats = content.split(',');

    int health = int.parse(stats[0]);
    int attack = int.parse(stats[1]);
    int defense = int.parse(stats[2]);

    return Character(name, health, attack, defense);
  }

  void attackMonster(Monster monster) {
    print('$name이(가) ${monster.name}에게 $attack의 데미지를 입혔습니다.');
    monster.health -= attack;
  }

  void defend() {}

  void showStatus() {
    print('$name - 체력: $health, 공격력: $attack, 방어력: $defense');
  }
}
