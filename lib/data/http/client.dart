// ignore_for_file: public_member_api_docs, depend_on_referenced_packages
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

///////////////////////////////////////////////////////////////////
final Provider<HttpClient> httpClientProvider = Provider<HttpClient>(
  (ProviderRef<HttpClient> ref) => HttpClient(),
);

////////////////////
class HttpClient {
  HttpClient() {
    _client = Client();
  }

  late Client _client;

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.http(Environment.apiEndPoint,
        '${Environment.apiBasePath}/$path', queryParameters);

    final response = await _client.post(uri,
        headers: await _headers, body: json.encode(body));

    final bodyString = utf8.decode(response.bodyBytes);

    try {
      if (bodyString.isEmpty) {
        throw Exception();
      }
      return jsonDecode(bodyString);
    } on Exception catch (_) {
      throw Exception('json parse error');
    }
  }

  Future<Map<String, String>> get _headers async {
    return <String, String>{
      'content-type': 'application/json',
    };
  }
}

///////////////////////////////////////////////////////////////////
class Environment {
  Environment._();

  static String get apiEndPoint => 'toyohide.work';

  static String get apiBasePath => 'BrainLog/api';
}
