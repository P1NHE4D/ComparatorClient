import 'dart:convert';

import 'package:comparator/models/classified_data.dart';
import 'package:comparator/models/emotion_scores.dart';
import 'package:comparator/models/keyword.dart';
import 'package:flutter/cupertino.dart';

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
  final Map<String, double> objASentimentScores;
  final Map<String, double> objBSentimentScores;
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
    this.objASentimentScores,
    this.objBSentimentScores,
    this.message
  });

  factory QueryResult.fromJson(String jsonStr) {
    final _map = jsonDecode(jsonStr);
    return QueryResult(
      results: ClassifiedData.fromJson(_map['results']),
      objAKeywords: (_map['objAKeywords'] as List).map((i) => Keyword.fromJson(i)).toList(),
      objBKeywords: (_map['objBKeywords'] as List).map((i) => Keyword.fromJson(i)).toList(),
      objAEmotions: EmotionScores.fromJson(_map['objAEmotions']),
      objBEmotions: EmotionScores.fromJson(_map['objBEmotions']),
      objASentimentScore: _map['objASentimentScore'],
      objBSentimentScore: _map['objBSentimentScore'],
    );
  }
}