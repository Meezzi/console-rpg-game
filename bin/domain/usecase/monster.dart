import 'character.dart';

class Monster {
  String name;
  int health;
  int attack;
  int defense = 0;

  Monster(this.name, this.health, this.attack, this.defense);

  void attackCharacter(Character character) {}

  void showStatus() {}
}
