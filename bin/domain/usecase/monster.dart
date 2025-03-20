import 'character.dart';

class Monster {
  String name;
  int health;
  int attack;
  int defense = 0;

  Monster(this.name, this.health, this.attack);
  factory Monster.fromPlainText(String content) {
    final stats = content.split(',');

    String name = stats[0].toString();
    int health = int.parse(stats[1]);
    int maxAttack = int.parse(stats[2]);

    return Monster(name, health, maxAttack);
  }

  void attackCharacter(Character character) {}

  void showStatus() {
    print('$name - 체력: $health, 공격력: $attack');
  }
}
