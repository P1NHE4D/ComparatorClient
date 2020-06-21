class ClassifiedData {
  final int dataCount;
  final double objATendency;
  final double objBTendency;
  final List objAData;
  final List objBData;

  ClassifiedData({
    this.dataCount,
    this.objATendency,
    this.objBTendency,
    this.objAData,
    this.objBData
  });

  factory ClassifiedData.fromJson(Map<String, dynamic> json) {
    return ClassifiedData(
      dataCount: json['dataCount'].toInt(),
      objATendency: json['objATendency'],
      objBTendency: json['objBTendency'],
      objAData: json['objAData'],
      objBData: json['objBData']
    );
  }
}