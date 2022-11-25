import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controller/pokemon.controller.dart';
import '../screen/pokemon_detail_screen.dart';

class PokemonSearch extends SearchDelegate {
  // @override
  // ThemeData appBarTheme(BuildContext context) {
  //   ThemeData themeData = Theme.of(context).copyWith(
  //     appBarTheme: const AppBarTheme(
  //         elevation: 0, toolbarTextStyle: TextStyle(color: Colors.white)),
  //   );
  //   return themeData;
  // }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, '');
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return query.isEmpty
        ? const Center(child: Text('Search through the PokeDex'))
        : Consumer<PokemonProvider>(
            builder: (ctx, data, child) {
              final searchResults = data.getSearchResults(query);
              return searchResults.isEmpty
                  ? Center(
                      child: Text('The pokemon with \'$query\' doesnt exist'),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 10),
                      itemCount: searchResults.length,
                      itemBuilder: (ctx, index) {
                        final pokemon = searchResults[index];
                        return ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => PokemonDetailScreen(
                                  id: pokemon.id.toString(),
                                ),
                              ),
                            );
                          },
                          leading: Image.network(
                            pokemon.imageUrl.toString(),
                            height: 80,
                            errorBuilder: (src, _, __) {
                              return Image.asset(
                                'assets/images/pokeball.png',
                                height: 80,
                              );
                            },
                          ),
                          title: Text(pokemon.name.toString()),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    );
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? const Center(child: Text('Search through the PokeDex'))
        : Consumer<PokemonProvider>(
            builder: (ctx, data, child) {
              final searchResults = data.getSearchResults(query);
              return searchResults.isEmpty
                  ? Center(
                      child: Text('The pokemon with \'$query\' doesnt exist'),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 10),
                      itemCount: searchResults.length,
                      itemBuilder: (ctx, index) {
                        final pokemon = searchResults[index];
                        return ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => PokemonDetailScreen(
                                      id: pokemon.id.toString(),
                                    )));
                          },
                          leading: Image.network(
                            pokemon.imageUrl.toString(),
                            height: 80,
                            errorBuilder: (src, _, __) {
                              return Image.asset(
                                'assets/images/pokeball.png',
                                height: 70,
                              );
                            },
                          ),
                          title: Text(pokemon.name.toString()),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    );
            },
          );
  }
}
