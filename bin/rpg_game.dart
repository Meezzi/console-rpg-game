import '../bin/utils/input.dart';
import 'utils/load_character.dart';

void main() async {
  String name = getUserName();
  String stats = await loadCharacterStatsAsync(name);
}
