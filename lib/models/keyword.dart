class Keyword {
  final String text;
  final num relevance;
  final num sentiment;

  Keyword({this.text, this.relevance, this.sentiment});

  factory Keyword.fromJson(Map<String, dynamic> json) {
    return Keyword(
      text: json['text'],
      relevance: json['relevance'],
      sentiment: json['sentiment']
    );
  }
}