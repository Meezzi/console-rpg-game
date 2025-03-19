import 'dart:io';

Future<String> loadCharacterStatsAsync(String name) async {
  final file = File('resource/characters.txt');
  return await file.readAsString();
}
