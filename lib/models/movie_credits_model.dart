import 'dart:convert';

class MovieCreditsModel {
  int id;
  List<Cast> cast;

  MovieCreditsModel({
    required this.id,
    required this.cast,
  });

  factory MovieCreditsModel.fromRawJson(String str) =>
      MovieCreditsModel.fromJson(json.decode(str));

  factory MovieCreditsModel.fromJson(Map<String, dynamic> json) =>
      MovieCreditsModel(
        id: json["id"] ?? 0,
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
      );
}

class Cast {
  bool adult;
  int gender;
  int id;
  String knowForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;

  Cast(
      {required this.adult,
      required this.gender,
      required this.id,
      required this.knowForDepartment,
      required this.name,
      required this.originalName,
      required this.popularity,
      required this.profilePath,
      required this.castId,
      required this.character,
      required this.creditId,
      required this.order});

  factory Cast.fromRawJson(String str) => Cast.fromJson(json.decode(str));

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
      adult: json["adult"] ?? false,
      gender: json["gender"] ?? 0,
      id: json["id"] ?? 0,
      knowForDepartment: json["know_for_department"] ?? '',
      name: json["name"] ?? '',
      originalName: json["original_name"] ?? '',
      popularity: json["popularity"].toDouble() ?? 0,
      profilePath: json["profile_path"] ?? '',
      castId: json["cast_id"] ?? 0,
      character: json["character"] ?? '',
      creditId: json["credit_id"] ?? '',
      order: json["order"] ?? 0,
    );
}
