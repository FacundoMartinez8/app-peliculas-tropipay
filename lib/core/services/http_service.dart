import 'dart:convert';

import 'package:app_peliculas/core/failure/failure.dart';
import 'package:app_peliculas/core/utils/entity.dart';
import 'package:http/http.dart';

abstract class HttpServiceBase {
  final Client http;

  HttpServiceBase({required this.http});

  Future<Map> get({required String url, Map<String, String>? headers});

  Future<Map> post({
    required String url,
    required Entity data,
    Map<String, String>? headers,
  });
}

class HttpService extends HttpServiceBase {
  HttpService({required super.http});

  @override
  Future<Map> get({required String url, Map<String, String>? headers}) async {
    var result = await http.get(Uri.parse(url), headers: headers);
    checkStatusCode(result.statusCode, result.body, url);
    return jsonDecode(result.body);
  }

  @override
  Future<Map> post({
    required String url,
    required Entity data,
    Map<String, String>? headers,
  }) async {
    var isUrlEncode = checkIfIsUrlEncoded(headers ?? {});
    var result = await http.post(
      Uri.parse(url),
      headers: headers,
      body: isUrlEncode ? data.toJson() : jsonEncode(data.toJson()),
    );
    checkStatusCode(result.statusCode, result.body, url);
    return jsonDecode(result.body);
  }

  bool checkIfIsUrlEncoded(Map<String, String> headers) {
    var isUrlEncode = false;
    headers.forEach((key, value) {
      if (key == 'Content-Type' &&
          value == 'application/x-www-form-urlencoded') {
        isUrlEncode = true;
      }
    });
    return isUrlEncode;
  }

  checkStatusCode(int statusCode, body, String url) {
    if (statusCode == 401 &&
        body.contains('Invalid client or Invalid client credentials')) {
      throw UnhandledFailure(message: 'Usuario o contraseña incorrectos');
    }

    if (statusCode == 400 && url.contains("token")) {
      if (jsonDecode(body)['error_description'] ==
          'Account is not fully set up') {
        throw AccountNotSetUpFailure();
      }
    }

    if (statusCode == 200) return;
    if (statusCode == 401) {
      // navigatorKey.currentState!.context.go(LoginPage.routeName);
    }
    throw UnhandledFailure(message: body);
  }
}
