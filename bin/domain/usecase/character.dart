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

  void attackMonster(Monster monster) {}

  void defend() {}

  void showStatus() {}
}
