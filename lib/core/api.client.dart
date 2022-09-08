import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokdex/core/errror/exception.dart';

import 'api.constants.dart';

class ApiClient {
  final http.Client _client;

  ApiClient(this._client);

  dynamic get(String path) async {
    final response = await _client.get(
      Uri.parse(ApiConstant.BASE_URL),
      headers: {
        "Content-Type": "application/json",
      },
    );

    try {
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return response.reasonPhrase;
      }
    } catch (error) {
      return ServerException();
    }
  }
}
