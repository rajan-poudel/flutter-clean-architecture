import 'package:pokdex/core/errror/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:pokdex/domain/repositories/pokemon_repositories.dart';
import 'package:pokdex/domain/usecases/usecase.dart';

import '../entities/pokemon_entity.dart';

class GetPokemonUsecase implements UseCase<List<PokemonEntity>, NoParams> {
  final PokemonRepository pokemonRepository;

  GetPokemonUsecase({required this.pokemonRepository});

    /// The return value may either be failure or value: as Either<L,R>

  @override
  Future<Either<AppError, List<PokemonEntity>>> call(NoParams params) async {
    return await pokemonRepository.getPokemonList();
  }
}
