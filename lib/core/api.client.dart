import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokdex/core/errror/exception.dart';

import 'api.constants.dart';

class ApiClient {
  final http.Client client;

  ApiClient({required this.client});

  dynamic get(String path) async {
    final response = await client.get(
      Uri.parse(ApiConstant.BASE_URL),
      headers: {
        "Content-Type": "application/json",
      },
    );

    try {
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return response.reasonPhrase;
      }
    } catch (error) {
      return ServerException();
    }
  }
}
