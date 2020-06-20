import 'dart:io';
import 'package:comparator/models/query_result.dart';
import 'package:http/http.dart' as http;

Future<QueryResult> sendQuery(String objA, String objB, List<String> aspects) async {
  final Map<String, String> queryParameters = {
    'objA': objA,
    'objB': objB,
    'aspects': aspects.join(' ')
  };
  final uri = Uri.https('www.comparator.p1nhe4d.com', '/api/', queryParameters);
  final response = await http.get(uri, headers: {
    HttpHeaders.contentTypeHeader: 'application/json'
  });

  if(response.statusCode == 200) {
    return QueryResult.fromJson(response.body);
  }
  throw Exception('Failed to fetch query result data');
}