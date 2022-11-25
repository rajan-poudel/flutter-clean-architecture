import 'package:dartz/dartz.dart';
import 'package:pokdex/core/errror/app_error.dart';
import 'package:pokdex/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository{
 Future<Either<AppError,List<PokemonEntity>>> getPokemonList();
}