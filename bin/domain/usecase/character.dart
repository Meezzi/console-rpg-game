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

  void defend(Monster monster) {
    int heal = (monster.attack / 10).toInt();
    print('$name이(가) 방어 태세를 취하여 $heal만큼 체력을 얻었습니다.');
    health += heal;
  }

  void showStatus() {
    print('$name - 체력: $health, 공격력: $attack, 방어력: $defense');
  }
}
