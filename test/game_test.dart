import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_iki_dogru_bir_yalan/oyun_iki_dogru_bir_yalan.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(ikiDogruConfig.title.length, 33);
    expect(ikiDogruConfig.tagline.length, 33);
    for (final s in ikiDogruConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(ikiDogruConfig.gameId, ikiDogruId);
    expect(ikiDogruRules.gameId, ikiDogruId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(ikiDogruRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: ikiDogruId, optionalMechanics: ikiDogruRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(ikiDogruRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
