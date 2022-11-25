import 'package:get_it/get_it.dart';
import 'package:pokdex/core/api.client.dart';
import 'package:pokdex/presentation/Controller/pokemon.controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../core/network/network.info.dart';
import '../data/datasources/pokemon.local.datasource.dart';
import '../data/datasources/pokemon.remote.datasource.dart';
import '../data/repositories/pokemon.repositories.impl.dart';
import '../domain/repositories/pokemon_repositories.dart';
import '../domain/usecases/get.pokemon.usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Feature(all feature dependency) -getPokemon feature

  //  *provider

  sl.registerFactory(
    () => PokemonProvider(
      pokemonUsecase: sl(),
    ),
  );

  //use case
  sl.registerLazySingleton(() => GetPokemonUsecase(pokemonRepository: sl()));

  // Repository
  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(
      networkInfo: sl(),
      pokemonLocalDatasource: sl(),
      pokemonRemoteDatasource: sl(),
    ),
  );

  //remote datasource
  sl.registerLazySingleton<PokemonRemoteDatasource>(
    () => PokemonRemoteDatasourceImpl(httpClient: sl()),
  );

  //local datasource
  sl.registerLazySingleton<PokemonLocalDatasource>(
    () => PokemonLocalDatasourceimpl(
      sharedPreferences: sl(),
    ),
  );

  //! core(all core dependency)

  //api
  sl.registerLazySingleton(() => ApiClient(client: sl()));

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  //! External dependency for example sharepreference httpClient etc
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  // sl.registerLazySingleton(() => DataConnectionChecker());
}
