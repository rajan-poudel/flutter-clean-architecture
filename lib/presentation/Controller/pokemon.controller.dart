import 'package:flutter/cupertino.dart';
import 'package:pokdex/domain/entities/pokemon_entity.dart';
import 'package:pokdex/domain/usecases/get.pokemon.usecase.dart';
import 'package:pokdex/domain/usecases/usecase.dart';

class PokemonProvider with ChangeNotifier {
  final GetPokemonUsecase pokemonUsecase;
  PokemonProvider({required this.pokemonUsecase});
  List<PokemonEntity> _pokemonList = [];
  List<PokemonEntity> get pokemonList => _pokemonList;

  Future<void> getPokemonData() async {
    final response = await pokemonUsecase.call(NoParams());
    response.fold((failure) {
      throw Error();
    }, (pokemonList) {
      _pokemonList = pokemonList;
      notifyListeners();
    });
  }
}
