import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient(this._client);

  final http.Client _client;
  static const baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://127.0.0.1:8000/api/',
  );

  Future<Map<String, dynamic>> get(String path) async {
    final base = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
    final response = await _client
        .get(Uri.parse(base).resolve(path))
        .timeout(const Duration(seconds: 10));
    if (response.statusCode != 200) {
      throw Exception('El servidor respondió con ${response.statusCode}.');
    }
    return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
  }
}
