import 'package:comparator/models/classified_data.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final Map<String, dynamic> json = {
    "dataCount": 3,
    "objATendency": 0.3,
    "objBTendency": 0.7,
    "objAData": [
      "Note that while it \"works\" on Windows, it offers better stability and performance on Linux or OS X. Operating System: Windows, Linux, OS X. ."
    ],
    "objBData": [
      "NET application stability, Linux is a better choice than Windows.",
      "It's not the stability (GNU/Linux' stability is far superior to Windows')."
    ]
  };

  test('Test ClassifiedData fromJson factory', () {
    final cd = ClassifiedData.fromJson(json);

    expect(cd.dataCount, 3);
    expect(cd.objATendency, 0.3);
    expect(cd.objBTendency, 0.7);
    expect(cd.objAData.length, 1);
    expect(cd.objBData.length, 2);
  });
}