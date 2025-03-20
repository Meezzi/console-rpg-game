import '../bin/utils/input.dart';
import '../bin/domain/usecase/character.dart';
import '../bin/domain/usecase/monster.dart';
import 'domain/usecase/game.dart';
import 'utils/load_character.dart';
import 'utils/load_monster.dart';

void main() async {
  try {
    String name = getUserName();
    String stats = await loadCharacterStatsAsync(name);

    Character character = Character.fromPlainText(name, stats);
    List<Monster> monster = loadMonsterStatsAsync();

    // 게임 객체 생성
    Game game = Game(character, monster);
  } catch (e) {
    print('오류가 발생했습니다 : $e');
  }
}
