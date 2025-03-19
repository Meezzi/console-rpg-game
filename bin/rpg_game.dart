import '../bin/utils/input.dart';
import '../bin/domain/usecase/character.dart';
import 'utils/load_character.dart';

void main() async {
  String name = getUserName();
  String stats = await loadCharacterStatsAsync(name);

  Character character = Character.fromPlainText(name, stats);
}
