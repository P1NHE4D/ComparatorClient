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
  final double objASentimentScore;
  final double objBSentimentScore;
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
    final _aspectResults = Map<String, ClassifiedData>();
    final _objAAspectEmotions = Map<String, EmotionScores>();
    final _objBAspectEmotions = Map<String, EmotionScores>();

    (_map['aspectResults'] as Map).forEach((key, value) {
      _aspectResults[key] = ClassifiedData.fromJson(value);
    });
    (_map['objAAspectEmotions'] as Map).forEach((key, value) {
      _objAAspectEmotions[key] = EmotionScores.fromJson(value);
    });
    (_map['objBAspectEmotions'] as Map).forEach((key, value) {
      _objBAspectEmotions[key] = EmotionScores.fromJson(value);
    });

    return QueryResult(
      results: ClassifiedData.fromJson(_map['results']),
      objAKeywords: (_map['objAKeywords'] as List).map((i) => Keyword.fromJson(i)).toList(),
      objBKeywords: (_map['objBKeywords'] as List).map((i) => Keyword.fromJson(i)).toList(),
      objAEmotions: EmotionScores.fromJson(_map['objAEmotions']),
      objBEmotions: EmotionScores.fromJson(_map['objBEmotions']),
      objASentimentScore: _map['objASentimentScore'],
      objBSentimentScore: _map['objBSentimentScore'],
      aspectResults: _aspectResults,
      objAAspectEmotions: _objAAspectEmotions,
      objBAspectEmotions: _objBAspectEmotions,
      objAAspectSentimentScores: _map['objAAspectSentimentScores'],
      objBAspectSentimentScores: _map['objBAspectSentimentScores']
    );
  }
}