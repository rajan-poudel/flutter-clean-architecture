import 'package:flutter/material.dart';
import 'package:pokdex/di/service_locator.dart' as di;
import 'package:pokdex/presentation/Controller/pokemon.controller.dart';
import 'package:provider/provider.dart';

import 'presentation/screen/pokemon_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // unawaited(di.init());
  await di.init();

  runApp(const PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => di.sl<PokemonProvider>(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PokemonListScreen(),
      ),
    );
  }
}
