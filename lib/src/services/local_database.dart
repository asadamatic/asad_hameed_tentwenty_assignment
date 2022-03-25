import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:movie_app/src/mvc/models/movie.dart' as movie_model;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'local_database.g.dart';

class Movies extends Table {
  BoolColumn get adult => boolean()();
  TextColumn get backdropPath => text()();
  TextColumn get genreIds => text()();
  IntColumn get id => integer()();
  TextColumn get originalLanguage => text()();
  TextColumn get originalTitle => text()();
  TextColumn get overview => text()();
  RealColumn get popularity => real()();
  TextColumn get posterPath => text()();
  DateTimeColumn get releaseDate => dateTime()();
  TextColumn get title => text()();
  BoolColumn get video => boolean()();
  RealColumn get voteAverage => real()();
  IntColumn get voteCount => integer()();
}

@DriftDatabase(tables: [Movies])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;

  Future<List<Movie>> getAllMovies() => select(movies).get();

  Future<void> insertMultipleEntries(List<movie_model.Movie> movieList) async {
    await batch((batch) {
      // functions in a batch don't have to be awaited - just
      // await the whole batch afterwards.
      batch.insertAll(movies, [
        for (movie_model.Movie movie in movieList)
          MoviesCompanion.insert(
              adult: movie.adult!,
              backdropPath: movie.backdropPath!,
              genreIds: movie.genreIds.toString(),
              id: movie.id!,
              originalLanguage: movie.originalLanguage!,
              originalTitle: movie.originalTitle!,
              overview: movie.overview!,
              popularity: movie.popularity!,
              posterPath: movie.posterPath!,
              releaseDate: movie.releaseDate!,
              title: movie.title!,
              video: movie.video!,
              voteAverage: movie.voteAverage!,
              voteCount: movie.voteCount!)
      ]);
    });
  }

  Future deleteMovies() => delete(movies).go();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
