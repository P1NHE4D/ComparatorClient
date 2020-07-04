class EmotionScores {
  final num anger;
  final num disgust;
  final num fear;
  final num joy;
  final num sadness;

  EmotionScores({this.anger, this.disgust, this.fear, this.joy, this.sadness});

  factory EmotionScores.fromJson(Map<String, dynamic> json) {
    return EmotionScores(
      anger: json['anger'],
      disgust: json['disgust'],
      fear: json['fear'],
      joy: json['joy'],
      sadness: json['sadness']
    );
  }
}