import 'package:comparator/models/emotion_scores.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final Map<String, double> json = {
    "anger": 0.097717,
    "disgust": 0.062338,
    "fear": 0.088491,
    "joy": 0.233566,
    "sadness": 0.163178
  };

  test('Test EmotionScores fromJson factory', () {
    final es = EmotionScores.fromJson(json);

    expect(es.anger, 0.097717);
    expect(es.disgust, 0.062338);
    expect(es.fear, 0.088491);
    expect(es.joy, 0.233566);
    expect(es.sadness, 0.163178);
  });
}