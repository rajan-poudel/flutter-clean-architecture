import 'dart:convert';

import 'package:pokdex/core/errror/exception.dart';
import 'package:pokdex/core/network/network.info.dart';
import 'package:pokdex/data/datasources/pokemon.local.datasource.dart';
import 'package:pokdex/data/datasources/pokemon.remote.datasource.dart';
import 'package:pokdex/domain/entities/pokemon_entity.dart';
import 'package:pokdex/core/errror/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:pokdex/domain/repositories/pokemon_repositories.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRemoteDatasource pokemonRemoteDatasource;
  PokemonLocalDatasource pokemonLocalDatasource;
  NetworkInfo networkInfo;

  PokemonRepositoryImpl(this.pokemonRemoteDatasource, this.networkInfo,
      this.pokemonLocalDatasource);
  @override
  Future<Either<AppError, List<PokemonEntity>>> getPokemonList() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePokemonlist =
            await pokemonRemoteDatasource.getPokemonList();
        pokemonLocalDatasource.setPokemonList(json.encode(remotePokemonlist));
        return Right(remotePokemonlist);
      } on ServerException {
        return const Left(AppError("Some things want error"));
      }
    } else {
      try {
        final localPokemonList = await pokemonLocalDatasource.getPokemonList();
        return Right(localPokemonList);
      } on CacheException {
        return const Left(AppError("Some things want error"));
      }
    }
  }
}
