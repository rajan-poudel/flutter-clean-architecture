import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/utility.dart';
import '../Controller/pokemon.controller.dart';
import '../widget/pokemon_list_item.dart';
import '../widget/pokemon_search.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({Key? key}) : super(key: key);

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  bool _isInit = true;
  late Future _fetchData;

  Future<void> _getPokemonData() async {
    try {
      await Provider.of<PokemonProvider>(context, listen: true)
          .getPokemonData();
    } catch (error) {
      print("Error is$error");
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _fetchData = _getPokemonData();
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PokeDex',
          style: TextStyle(fontSize: 28),
        ),
        backgroundColor: PokemonUtils.getColorType("Grass"),

        // backgroundColor: Theme.of(context).highlightColor,
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
              onPressed: () {
                showSearch(context: context, delegate: PokemonSearch());
              }),
          // IconButton(
          //     icon: const Icon(Icons.favorite_border, size: 30),
          //     onPressed: () {
          //       // Navigator.of(context).push(
          //       //     MaterialPageRoute(builder: (ctx) => FavouriteScreen()));
          //     })
        ],
      ),
      body: FutureBuilder(
        future: _fetchData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              // ? const Center(child: CircularProgressIndicator())
              ? Opacity(
                  opacity: 0.5,
                  child: Shimmer.fromColors(
                    baseColor: Colors.black12,
                    highlightColor: Colors.white,
                    child: Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10),
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                ),
                              );
                            })),
                  ),
                )
              : snapshot.hasError
                  ? const Center(child: Text('Sorry data could not be loaded'))
                  : Consumer<PokemonProvider>(
                      builder: (ctx, data, child) {
                        return RefreshIndicator(
                          triggerMode: RefreshIndicatorTriggerMode.onEdge,
                          onRefresh: () async {
                            setState(() {
                              _fetchData = _getPokemonData();
                            });
                          },
                          child: GridView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10),
                            itemCount: data.pokemonList.length,
                            itemBuilder: (ctx, index) {
                              final pokemon = data.pokemonList[index];
                              return PokemonListItem(
                                pokemon: pokemon,
                              );
                            },
                          ),
                        );
                      },
                    );
        },
      ),
    );
  }
}
