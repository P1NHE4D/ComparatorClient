class Keyword {
  final String text;
  final double relevance;
  final double sentiment;

  Keyword({this.text, this.relevance, this.sentiment});

  factory Keyword.fromJson(Map<String, dynamic> json) {
    return Keyword(
      text: json['text'],
      relevance: json['relevance'],
      sentiment: json['sentiment']
    );
  }
}