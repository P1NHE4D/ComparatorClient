class EmotionScores {
  final double anger;
  final double disgust;
  final double fear;
  final double joy;
  final double sadness;

  EmotionScores({this.anger, this.disgust, this.fear, this.joy, this.sadness});

  factory EmotionScores.fromJson(Map<String, dynamic> json) {
    return EmotionScores(
      anger: json['anger']?.toDouble(),
      disgust: json['disgust']?.toDouble(),
      fear: json['fear']?.toDouble(),
      joy: json['joy']?.toDouble(),
      sadness: json['sadness']?.toDouble()
    );
  }
}