// To parse this JSON data, do
//
//     final films = filmsFromJson(jsonString);

import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

part 'films_model.g.dart';

Films filmsFromJson(String str) => Films.fromJson(json.decode(str));

String filmsToJson(Films data) => json.encode(data.toJson());

@HiveType(typeId : 1)
class Films {
    Films({
        required this.title,
        required this.year,
        required this.poster,
        required this.ratings,
    });
    @HiveField(0)
    String title;
    @HiveField(1)
    String year;
    @HiveField(2)
    String poster;
    @HiveField(3)
    List<Rating> ratings;

    factory Films.fromJson(Map<String, dynamic> json) => Films(
        title: json["Title"],
        year: json["Year"],
        poster: json["Poster"],
        ratings: List<Rating>.from(json["Ratings"].map((x) => Rating.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "Poster": poster,
        "Ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
    };
}

@HiveType(typeId : 2)
class Rating {
    Rating({
        required this.source,
        required this.value,
    });

    @HiveField(0)
    String source;
    @HiveField(1)
    String value;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        source: json["Source"],
        value: json["Value"],
    );

    Map<String, dynamic> toJson() => {
        "Source": source,
        "Value": value,
    };
}
