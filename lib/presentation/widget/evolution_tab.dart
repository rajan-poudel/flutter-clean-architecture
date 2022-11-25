import 'package:flutter/material.dart';
import 'package:pokdex/domain/entities/pokemon_entity.dart';
import 'package:provider/provider.dart';

import '../Controller/pokemon.controller.dart';

class EvolutionTab extends StatefulWidget {
  final PokemonEntity pokemonEntity;

  const EvolutionTab({Key? key, required this.pokemonEntity}) : super(key: key);

  @override
  _EvolutionTabState createState() => _EvolutionTabState();
}

class _EvolutionTabState extends State<EvolutionTab> {
  final List<PokemonEntity> _evolutions = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final evolutions = widget.pokemonEntity.evolutions;
    for (var id in evolutions!) {
      final pokemon = Provider.of<PokemonProvider>(context, listen: false)
          .getPokemonById(id);
      _evolutions.add(pokemon);
    }
  }

  Widget _buildEvolution(
      PokemonEntity firstPokemon, PokemonEntity secondPokemon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.network(
              firstPokemon.imageUrl.toString(),
              height: 100,
              errorBuilder: (src, _, __) {
                return Image.asset(
                  'assets/images/pokeball.png',
                  height: 80,
                );
              },
            ),
            Text(
              firstPokemon.name.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
        Column(
          children: [
            const Icon(Icons.arrow_forward),
            Text(
              secondPokemon.evolveLevel.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ],
        ),
        Column(
          children: [
            Image.network(
              secondPokemon.imageUrl.toString(),
              height: 100,
              errorBuilder: (src, _, __) {
                return Image.asset(
                  'assets/images/pokeball.png',
                  height: 80,
                );
              },
            ),
            Text(
              secondPokemon.name.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
      ],
    );
  }

  List<Widget> _buildEvolutionList() {
    if (_evolutions.length < 2) {
      return [
        const Center(
          child: Text('No Evolutions available'),
        )
      ];
    }
    return Iterable<int>.generate(_evolutions.length - 1)
        .map((index) =>
            _buildEvolution(_evolutions[index], _evolutions[index + 1]))
        .expand((widget) => [
              widget,
              const Divider(
                thickness: 1.2,
              )
            ])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildEvolutionList(),
    );
  }
}
