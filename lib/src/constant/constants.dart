import 'package:movie_app/src/mvc/models/genre.dart';
import 'package:collection/collection.dart';

class AppConstants {
  static const String screenTitle = 'Watch';
  static const String searchFieldHintText = 'TV shows, movies and more';

  // Get builder ids
  static const String movieScreenStateBuilder = 'movieScreenStateBuilder';
  static const String movieScreenListBuilder = 'movieScreenListBuilder';
  static const String genre = 'Genre';
  static const String overview = 'Overview';
  static const String getTickets = 'Get Tickets';
  static const String watchTrailer = 'Trailer';
  static const String inTheaters = 'In Theaters';

  static const String upcomingMoviesLoadingBuilder =
      'upcomingMoviesLoadingBuilder';
  static const String searchingMoviesLoadingBuilder =
      'searchingMoviesLoadingBuilder';

  // API Key for Imagedb
  static const String apiKey = 'd39e7a01f5b3d571716b3f34f2e3860f';

  static final Map<int, Genre> genres = {
    28: Genre(id: 28, name: "Action", image: 'assets/action.jpeg'),
    12: Genre(id: 12, name: "Adventure", image: 'assets/adventure.jpeg'),
    16: Genre(id: 16, name: "Animation", image: 'assets/animation.jpeg'),
    35: Genre(id: 35, name: "Comedy", image: 'assets/comedy.jpeg'),
    80: Genre(id: 80, name: "Crime", image: 'assets/crime.jpeg'),
    99: Genre(id: 99, name: "Documentary", image: 'assets/documentary.jpeg'),
    18: Genre(id: 18, name: "Drama", image: 'assets/drama.jpeg'),
    10751: Genre(id: 10751, name: "Family", image: 'assets/family.jpeg'),
    14: Genre(id: 14, name: "Fantasy", image: 'assets/fantasy.jpeg'),
    36: Genre(id: 36, name: "History", image: 'assets/history.jpeg'),
    27: Genre(id: 27, name: "Horror", image: 'assets/horror.jpeg'),
    10402: Genre(id: 10402, name: "Music", image: 'assets/music.jpeg'),
    9648: Genre(id: 9648, name: "Mystery", image: 'assets/mystery.jpeg'),
    10749: Genre(id: 10749, name: "Romance", image: 'assets/family.jpeg'),
    878: Genre(id: 878, name: "Science Fiction", image: 'assets/sci-fi.jpeg'),
    10770: Genre(id: 10770, name: "TV Movie", image: 'assets/tv-movie.jpeg'),
    53: Genre(id: 53, name: "Thriller", image: 'assets/thriller.jpeg'),
    10752: Genre(id: 10752, name: "War", image: 'assets/war.jpeg'),
    37: Genre(id: 37, name: "Western", image: 'assets/western.jpeg'),
    10759: Genre(id: 10759, name: "Action & Adventure", image: 'assets/action'),
    10762: Genre(id: 10762, name: "Kids", image: 'assets/action'),
    10763: Genre(id: 10763, name: "News", image: 'assets/action'),
    10764: Genre(id: 10764, name: "Reality", image: 'assets/action'),
    10765: Genre(id: 10765, name: "Sci-Fi & Fantasy", image: 'assets/action'),
    10766: Genre(id: 10766, name: "Soap", image: 'assets/action'),
    10767: Genre(id: 10767, name: "Talk", image: 'assets/action'),
    10768: Genre(id: 10768, name: "War & Politics", image: 'assets/action'),
  };

  static final Function equalLists = const ListEquality().equals;
}
