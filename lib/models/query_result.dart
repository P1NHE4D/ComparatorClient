import 'dart:convert';

import 'package:comparator/models/classified_data.dart';
import 'package:comparator/models/emotion_scores.dart';
import 'package:comparator/models/keyword.dart';

class QueryResult {
  final ClassifiedData results;
  final List<Keyword> objAKeywords;
  final List<Keyword> objBKeywords;
  final EmotionScores objAEmotions;
  final EmotionScores objBEmotions;
  final num objASentimentScore;
  final num objBSentimentScore;
  final Map<String, ClassifiedData> aspectResults;
  final Map<String, EmotionScores> objAAspectEmotions;
  final Map<String, EmotionScores> objBAspectEmotions;
  final Map<String, dynamic> objAAspectSentimentScores;
  final Map<String, dynamic> objBAspectSentimentScores;
  final String message;

  QueryResult({
    this.results,
    this.objAKeywords,
    this.objBKeywords,
    this.objAEmotions,
    this.objBEmotions,
    this.objASentimentScore,
    this.objBSentimentScore,
    this.aspectResults,
    this.objAAspectEmotions,
    this.objBAspectEmotions,
    this.objAAspectSentimentScores,
    this.objBAspectSentimentScores,
    this.message
  });

  factory QueryResult.fromJson(String jsonStr) {
    final _map = jsonDecode(jsonStr);

    return QueryResult(
      results: ClassifiedData.fromJson(_map['results']),
      objAKeywords: (_map['objAKeywords'] as List)?.map((i) => Keyword?.fromJson(i))?.toList(),
      objBKeywords: (_map['objBKeywords'] as List)?.map((i) => Keyword?.fromJson(i))?.toList(),
      objAEmotions: EmotionScores.fromJson(_map['objAEmotions']),
      objBEmotions: EmotionScores.fromJson(_map['objBEmotions']),
      objASentimentScore: _map['objASentimentScore'] ?? 0.0,
      objBSentimentScore: _map['objBSentimentScore'] ?? 0.0,
      aspectResults: (_map['aspectResults'] as Map)?.map((key, value) => MapEntry(key, ClassifiedData?.fromJson(value))),
      objAAspectEmotions: (_map['objAAspectEmotions'] as Map)?.map((key, value) => MapEntry(key, EmotionScores?.fromJson(value))),
      objBAspectEmotions: (_map['objBAspectEmotions'] as Map)?.map((key, value) => MapEntry(key, EmotionScores?.fromJson(value))),
      objAAspectSentimentScores: _map['objAAspectSentimentScores'],
      objBAspectSentimentScores: _map['objBAspectSentimentScores'],
      message: _map['message']
    );
  }
}