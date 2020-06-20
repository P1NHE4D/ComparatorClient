import 'package:comparator/models/keyword.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final Map<String, dynamic> json = {
    "text": "Better Windows",
    "relevance": 0.941919,
    "sentiment": -0.364382
  };

  test('Test Keyword fromJson factory', () {
    final kw = Keyword.fromJson(json);

    expect(kw.text, "Better Windows");
    expect(kw.relevance, 0.941919);
    expect(kw.sentiment, -0.364382);
  });
}