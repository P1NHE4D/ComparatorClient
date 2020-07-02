class ClassifiedData {
  final num dataCount;
  final num objATendency;
  final num objBTendency;
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