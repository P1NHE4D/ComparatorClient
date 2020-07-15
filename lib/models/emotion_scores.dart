class EmotionScores {
  final double anger;
  final double disgust;
  final double fear;
  final double joy;
  final double sadness;

  EmotionScores({this.anger, this.disgust, this.fear, this.joy, this.sadness});

  factory EmotionScores.fromJson(Map<String, dynamic> json) {
    if (json == null)
      return EmotionScores(anger: 0.0, disgust: 0.0, fear: 0.0, joy: 0.0, sadness: 0.0);
    return EmotionScores(
        anger: json['anger']?.toDouble() ?? 0.0,
        disgust: json['disgust']?.toDouble() ?? 0.0,
        fear: json['fear']?.toDouble() ?? 0.0,
        joy: json['joy']?.toDouble() ?? 0.0,
        sadness: json['sadness']?.toDouble() ?? 0.0);
  }
}
