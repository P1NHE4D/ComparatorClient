import 'package:http/http.dart' as http;

Future<http.Response> sendQuery(String objA, String objB, List<String> aspects) {
  // TODO: Change return Type to QueryResult
  return http.get('');
}