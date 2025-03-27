import 'monster.dart';

class Character {
  String name;
  int health;
  int attack;
  late int originAttack;
  int defense;
  bool usedItem = false;

  Character(this.name, this.health, this.attack, this.defense) {
    originAttack = attack;
  }
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
    attack = originAttack;
  }

  void defend(Monster monster) {
    int heal = (monster.attack / 10).toInt();
    print('$name이(가) 방어 태세를 취하여 $heal만큼 체력을 얻었습니다.');
    health += heal;
  }

  void showStatus() {
    print('$name - 체력: $health, 공격력: $attack, 방어력: $defense');
  }

  // 캐릭터의 체력 회복
  void heal() {
    health += 10;
    print('보너스 체력을 얻었습니다! 현재 체력: $health');
  }

  // 아이템 사용
  void useItem() {
    if (!usedItem) {
      print('아이템을 사용하여 $name의 공격력이 두 배가 됩니다!');
      attack *= 2;
      usedItem = true;
    } else {
      print('이미 아이템을 사용하셨습니다.');
    }
  }
}
