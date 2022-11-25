import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokdex/domain/entities/pokemon_entity.dart';

class AboutTab extends StatelessWidget {
  final PokemonEntity pokemon;
  const AboutTab({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          pokemon.description.toString(),
          style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Height',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      pokemon.height.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Weight',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      pokemon.weight.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const Text(
              'Gender',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(width: 50),
            Row(
              children: [
                const Icon(
                  FontAwesomeIcons.mars,
                  color: Colors.blue,
                ),
                const SizedBox(width: 10),
                Text(
                  pokemon.malePercentage.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Icon(FontAwesomeIcons.venus, color: Colors.pink),
                const SizedBox(width: 10),
                Text(
                  pokemon.femalePercentage.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
