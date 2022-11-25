import 'package:pokdex/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  @override
  String? id;
  @override
  String? name;
  @override
  String? description;
  @override
  String? category;
  @override
  String? imageUrl;
  @override
  String? height;
  @override
  String? weight;
  @override
  int? hp;
  @override
  int? attack;
  @override
  int? defense;
  @override
  int? specialAttack;
  @override
  int? specialDefense;
  @override
  int? speed;
  @override
  int? total;
  @override
  String? malePercentage;
  @override
  String? femalePercentage;
  @override
  String? eggGroups;
  @override
  String? evolvedFrom;
  @override
  String? cycles;
  @override
  String? baseExp;
  @override
  List<String>? weaknesses;
  @override
  List<String>? evolutions;
  @override
  List<String>? types;
  @override
  List<String>? abilities;
  @override
  String? evolveLevel;
  @override
  bool isFavourite = false;

  PokemonModel({
    this.id,
    this.name,
    this.description,
    this.category,
    this.imageUrl,
    this.height,
    this.weight,
    this.hp,
    this.attack,
    this.defense,
    this.specialAttack,
    this.specialDefense,
    this.speed,
    this.total,
    this.malePercentage,
    this.femalePercentage,
    this.eggGroups,
    this.evolvedFrom,
    this.cycles,
    this.baseExp,
    this.weaknesses,
    this.evolutions,
    this.types,
    this.abilities,
    this.evolveLevel,
    this.isFavourite = false,
  }) : super(
          id: id,
          name: name,
          description: description,
          category: category,
          imageUrl: category,
          height: height,
          weight: weight,
          hp: hp,
          attack: attack,
          defense: defense,
          specialAttack: specialAttack,
          specialDefense: specialDefense,
          speed: speed,
          total: total,
          malePercentage: malePercentage,
          femalePercentage: femalePercentage,
          eggGroups: eggGroups,
          evolvedFrom: evolveLevel,
          cycles: cycles,
          baseExp: baseExp,
          weaknesses: weaknesses,
          evolutions: evolutions,
          types: types,
          abilities: abilities,
          evolveLevel: evolveLevel,
        );

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
        id: json['id'],
        description: json['xdescription'],
        name: json['name'],
        imageUrl: json['imageurl'],
        hp: json['hp'],
        defense: json['defense'],
        attack: json['attack'],
        speed: json['speed'],
        total: json['total'],
        specialAttack: json['special_attack'],
        specialDefense: json['special_defense'],
        baseExp: json['base_exp'],
        malePercentage: json['male_percentage'],
        femalePercentage: json['female_percentage'],
        evolutions: json['evolutions'].cast<String>(),
        height: json['height'],
        weight: json['weight'],
        weaknesses: json['weaknesses'].cast<String>(),
        abilities: json['abilities'].cast<String>(),
        category: json['category'],
        types: json['typeofpokemon'].cast<String>(),
        cycles: json['cycles'],
        eggGroups: json['egg_groups'],
        evolvedFrom: json['evolvedFrom'],
        evolveLevel: json['reason']);
  }
}
