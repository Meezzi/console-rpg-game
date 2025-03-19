import 'dart:io';

Future<String> loadCharacterStatsAsync(String name) async {
  try {
    final file = File('resource/characters.txt');
    return await file.readAsString();
  } on PathNotFoundException {
    throw ('파일의 지정된 경로를 찾을 수 없습니다.');
  } catch (e) {
    throw ('캐릭터 데이터를 불러오는 데 실패했습니다: $e');
  }
}
