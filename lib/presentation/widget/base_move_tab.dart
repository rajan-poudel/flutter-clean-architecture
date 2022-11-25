import 'package:flutter/material.dart';
import 'package:pokdex/domain/entities/pokemon_entity.dart';

import '../../core/utility.dart';

class BaseMoveTab extends StatelessWidget {
  final PokemonEntity pokemon;
  const BaseMoveTab({Key? key, required this.pokemon}) : super(key: key);

  Widget _buildItem(String title, int value) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.grey.shade700),
            )),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: Text(
              '$value',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87),
            )),
        Expanded(
          flex: 2,
          child: LinearProgressIndicator(
            value: value / 100,
            backgroundColor: PokemonUtils.getColor(pokemon).withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(
              PokemonUtils.getColor(pokemon),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildItem('HP', pokemon.hp!),
        const SizedBox(
          height: 15,
        ),
        _buildItem('Attack', pokemon.attack!),
        const SizedBox(
          height: 15,
        ),
        _buildItem('Speed', pokemon.speed!),
        const SizedBox(
          height: 15,
        ),
        _buildItem('Defense', pokemon.defense!),
        const SizedBox(
          height: 15,
        ),
        _buildItem('Sp. Attack', pokemon.specialAttack!),
        const SizedBox(
          height: 15,
        ),
        _buildItem('Sp. Defense', pokemon.specialDefense!),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
