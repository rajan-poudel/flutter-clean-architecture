import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:pokdex/core/api.constants.dart';
import 'package:pokdex/core/errror/exception.dart';

abstract class PokemonRemoteDatasource {
  Future<String> getPokemonList();
}

class PokemonRemoteDatasourceImpl implements PokemonRemoteDatasource {
  final http.Client httpClient;
  PokemonRemoteDatasourceImpl({required this.httpClient});
  @override
  Future<String> getPokemonList() async {
    try {
      final response = await httpClient.get(Uri.parse(ApiConstant.BASE_URL));
      log(response.body);
      return response.body;
    } catch (error) {
      throw ServerException();
    }
  }
}

// class PokemonRemoteDatasourceImpl implements PokemonRemoteDatasource{
//   ApiClient apiClient;
//   PokemonRemoteDatasourceImpl({required this.apiClient});
//   @override
//   Future<String> getPokemonList() async{
//     final response = await apiClient.get("");
//     final pokemonlist = PokemonModel.fromJson(response);
//     return response;

//   } 
// }

