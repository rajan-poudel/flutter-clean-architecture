import 'package:http/http.dart' as http;
import 'package:pokdex/core/api.client.dart';
import 'package:pokdex/data/models/pokemon.model.dart';

import '../../domain/entities/pokemon_entity.dart';

abstract class PokemonRemoteDatasource {
 Future<List<PokemonModel>> getPokemonList();
}

class PokemonRemoteDatasourceImpl implements PokemonRemoteDatasource{
  ApiClient apiClient;
  PokemonRemoteDatasourceImpl(this.apiClient);
  @override
  Future<List<PokemonModel>> getPokemonList() async{
    final response = await apiClient.get("");
    return response;

  } 
}