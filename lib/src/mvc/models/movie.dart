import 'dart:convert';

import 'package:movie_app/src/mvc/models/media.dart';
import 'package:movie_app/src/services/local_database.dart' as movie_database;

class Movie extends Media {
  bool? adult;

  Movie({
    this.adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    DateTime? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) : super(
            backdropPath: backdropPath,
            genreIds: genreIds,
            id: id,
            originalLanguage: originalLanguage,
            originalTitle: originalTitle,
            overview: overview,
            popularity: popularity,
            posterPath: posterPath,
            releaseDate: releaseDate,
            title: title,
            video: video,
            voteAverage: voteAverage,
            voteCount: voteCount);

  factory Movie.fromJson(json) {
    return Movie(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'].cast<int>(),
      id: json["id"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"],
      posterPath: json["poster_path"],
      releaseDate: DateTime.parse(json["release_date"]),
      title: json["title"],
      video: json["video"],
      voteAverage: double.parse(json["vote_average"].toString()),
      voteCount: json["vote_count"],
    );
  }

  factory Movie.fromDatabase(movie_database.Movie movie) {
    return Movie(
      adult: movie.adult,
      backdropPath: movie.backdropPath,
      genreIds: json.decode(movie.genreIds).cast<int>(),
      id: movie.id,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath,
      releaseDate: movie.releaseDate,
      title: movie.title,
      video: movie.video,
      voteAverage: double.parse(movie.voteAverage.toString()),
      voteCount: movie.voteCount,
    );
  }
}
