import 'dart:async';
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
  try {
    final response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json'
    }).timeout(Duration(seconds: 300));

    if(response.statusCode == 200) {
      return QueryResult.fromJson(response.body);
    }
    if(response.statusCode == 400) {
      throw Exception('The query was invalid.');
    }
    if(response.statusCode >= 500) {
      throw Exception('The server is currently unavailable.');
    }
    throw Exception('The query failed.');
  } on TimeoutException catch (_) {
    throw Exception('The server did not respond in the given time frame.');
  }
}