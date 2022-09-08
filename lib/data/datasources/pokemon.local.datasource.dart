import 'dart:convert';

import 'package:pokdex/core/errror/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/pokemon.model.dart';

abstract class PokemonLocalDatasource {
  Future<List<PokemonModel>> getPokemonList();
  Future<void> setPokemonList(String pokemonResponse);
}

const CACHED_DATA = "CHACHED_POKEMON";

class PokemonLocalDatasourceimpl implements PokemonLocalDatasource {
  final SharedPreferences sharedPreferences;
  PokemonLocalDatasourceimpl(this.sharedPreferences);
  @override
  Future<List<PokemonModel>> getPokemonList() {
    final jsonString = sharedPreferences.getString(CACHED_DATA);
    if (jsonString != null) {
      List<dynamic> responseList = jsonDecode(jsonString);
      List<PokemonModel> pokemons = List<PokemonModel>.from(responseList);
      return Future.value(pokemons);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> setPokemonList(String pokemonResponse) {
    return sharedPreferences.setString(CACHED_DATA, pokemonResponse);
  }
}
