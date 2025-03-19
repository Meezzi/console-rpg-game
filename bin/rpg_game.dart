import '../bin/utils/input.dart';
import '../bin/domain/usecase/character.dart';
import 'utils/load_character.dart';

void main() async {
  try {
    String name = getUserName();
    String stats = await loadCharacterStatsAsync(name);

    Character character = Character.fromPlainText(name, stats);
  } catch (e) {
    print('오류가 발생했습니다 : $e');
  }
}
