class ClassifiedData {
  final int dataCount;
  final double objATendency;
  final double objBTendency;
  final List<String> objAData;
  final List<String> objBData;

  ClassifiedData({
    this.dataCount,
    this.objATendency,
    this.objBTendency,
    this.objAData,
    this.objBData
  });

  factory ClassifiedData.fromJson(Map<String, dynamic> json) {
    return ClassifiedData(
      dataCount: json['dataCount']?.toInt(),
      objATendency: json['objATendency']?.toDouble(),
      objBTendency: json['objBTendency']?.toDouble(),
      objAData: (json['objAData'] as List).map((e) => e.toString()).toList(),
      objBData: (json['objBData'] as List).map((e) => e.toString()).toList()
    );
  }
}