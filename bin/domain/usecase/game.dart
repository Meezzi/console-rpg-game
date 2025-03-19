import 'character.dart';
import 'monster.dart';

class Game {
  Character character;
  List<Monster> monsters;
  int defeatedMonsterCount;

  Game(this.character, this.monsters, this.defeatedMonsterCount);

  void startGame() {}

  void battle() {}

  void getRandomMonster() {}
}
