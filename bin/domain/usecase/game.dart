import 'dart:math';
import 'character.dart';
import 'monster.dart';

class Game {
  Character character;
  List<Monster> monsters;
  int defeatedMonsterCount;

  Game(this.character, this.monsters, this.defeatedMonsterCount);

  void startGame() {}

  void battle() {}

  Monster getRandomMonster() {
    Monster monster = monsters[Random().nextInt(monsters.length)];
    return monster;
  }
}
