class Media {
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Media(
      {this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});
  factory Media.fromJson(json) {
    return Media(
      backdropPath: json['backdrop_path'] ?? '',
      genreIds: json['genre_ids']?.cast<int>() ?? [],
      id: json["id"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"] ?? json["original_name"],
      overview: json["overview"],
      popularity: json["popularity"],
      posterPath: json["poster_path"] ?? '',
      releaseDate: DateTime.parse(
          json["release_date"] ?? json['first_air_date'] ?? '2000-01-01'),
      title: json["title"] ?? json["name"],
      video: json["video"],
      voteAverage: double.parse(json["vote_average"]?.toString() ?? '0'),
      voteCount: json["vote_count"],
    );
  }
}
