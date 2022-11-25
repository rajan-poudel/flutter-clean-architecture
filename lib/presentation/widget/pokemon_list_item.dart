import 'package:flutter/material.dart';
import 'package:pokdex/domain/entities/pokemon_entity.dart';

import '../../core/utility.dart';

class PokemonListItem extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonListItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        color: PokemonUtils.getColor(pokemon),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (ctx) => PokemonDetailScreen(
            //       id: pokemon.id,
            //     ),
            //   ),
            // );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      pokemon.id.toString(),
                      style:
                          TextStyle(color: Colors.grey.shade300, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  pokemon.name.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: pokemon.types!
                            .map((type) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 4),
                                  decoration: BoxDecoration(
                                      color: PokemonUtils.getColorType(
                                          pokemon.types.toString()),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.white)),
                                  child: Text(type,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                ))
                            .toList(),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Hero(
                        tag: 'pokemon${pokemon.id}',
                        child: Image.network(
                          pokemon.imageUrl.toString(),
                          height: 100,
                          errorBuilder: (src, _, __) {
                            return Image.asset(
                              'assets/images/pokeball.png',
                              height: 70,
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
