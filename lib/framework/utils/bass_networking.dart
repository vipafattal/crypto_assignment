import 'dart:convert' show json;
import 'dart:io' show SocketException;

import 'package:crypto_assignment/framework/consts.dart';
import 'package:crypto_assignment/framework/utils/exceptions.dart';
import 'package:crypto_assignment/models/network_process.dart';
import 'package:http/http.dart' as http;

class Networking {
  static const _AUTHORIZATION_HEADER = "X-CMC_PRO_API_KEY";

  static Future<NetworkProcess<T>> getRequest<T>({
    String url = API_URL,
    String token = API_TOKEN,
    required String endpoint,
    required T Function(dynamic data) transform,
  }) async {
    try {
      final response = await _getRawRequest(
        url: url,
        token: token,
        endpoint: endpoint,
      );

      final statusCode = response.statusCode;
      if (statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        return NetworkProcess.succeeded(newData: transform(data['data']));
      } else {
        final errorMsg =
            "Network process failed on: $url$endpoint, with status code($statusCode).";
        print(errorMsg);
        return NetworkProcess.failed(getErrorByCode(statusCode));
      }
    } on SocketException {
      return NetworkProcess.failed(
          getErrorByCode(NetworkException.DEFAULT_EXCEPTION));
    }
  }

  static Future<http.Response> _getRawRequest({
    String url = API_URL,
    String token = API_TOKEN,
    required String endpoint,
  }) async {
    var response;
    response = await http.get(
      Uri.parse(url + endpoint),
      headers: {
        _AUTHORIZATION_HEADER: token,
      },
    );

    return response;
  }
}
