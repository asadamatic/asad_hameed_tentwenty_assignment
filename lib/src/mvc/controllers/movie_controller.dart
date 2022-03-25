import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app/src/constant/constants.dart';
import 'package:movie_app/src/mvc/models/media.dart';
import 'package:movie_app/src/mvc/models/movie.dart' as movie_model;
import 'package:movie_app/src/mvc/models/movie_screen_states.dart';
import 'package:movie_app/src/mvc/models/movies_loading_state.dart';
import 'package:movie_app/src/mvc/models/searching_state.dart';
import 'package:movie_app/src/mvc/views/movie_detail_screen.dart';
import 'package:movie_app/src/mvc/views/search_resutls_screen.dart';
import 'package:movie_app/src/mvc/views/trailer_video.dart';
import 'package:movie_app/src/services/local_database.dart';
import 'package:movie_app/src/services/requests.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieController extends GetxController {
  // Controllers
  PersistentTabController? persistentTabController =
      PersistentTabController(initialIndex: 1);
  YoutubePlayerController? youtubeVideoController;

  // Utilities
  Directory? directory;

  // Services
  MyDatabase? _myDatabase;
  final AppRequests _appRequests = AppRequests();

  // Models
  List<movie_model.Movie> upcomingMovies = [];
  List<Media> searchedMedia = [];
  // Navigation Bar

  // Enums
  MovieScreenState movieScreenState = MovieScreenState.upcomingMovies;
  MovieLoadingState movieLoadingState = MovieLoadingState.loading;
  SearchingState searchingState = SearchingState.loading;

  // Called when [search] button is pressed and searchField is displayed in the app bar
  startSearch() {
    movieScreenState = MovieScreenState.genres;
    update([
      AppConstants.movieScreenStateBuilder,
      AppConstants.movieScreenListBuilder
    ]);
  }

  // Called when [close] button is pressed in the [searchField] and
  // [searchField] is dismissed from the app bar
  endSearch() {
    movieScreenState = MovieScreenState.upcomingMovies;
    update([
      AppConstants.movieScreenStateBuilder,
      AppConstants.movieScreenListBuilder
    ]);
  }

  // Called when the user is [done] with typing search query
  search(BuildContext context) {
    pushNewScreen(
      context,
      screen: const SearchResultsScreen(),
      withNavBar: true,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  // Going back to [MovieListScreen] from a different screen byt popping the current screen
  backToMovieListScreen(BuildContext context) {
    Navigator.pop(context);
  }

  // This function is assigned to the [onChanged] parameter of [searchField]
  // Called whenever the search query changes, to update the results accordingly
  onSearchTextChanged(String? newSearchText) async {
    if (newSearchText!.isNotEmpty) {
      searchingState = SearchingState.loading;
      update([AppConstants.searchingMoviesLoadingBuilder]);
      final response = await _appRequests.searchMovies(newSearchText);
      searchedMedia = jsonDecode(response.body)['results']
          .map((media) => Media.fromJson(media))
          .toList()
          .cast<Media>();
      movieScreenState = MovieScreenState.search;
      searchingState = SearchingState.loaded;
      update([
        AppConstants.searchingMoviesLoadingBuilder,
        AppConstants.movieScreenListBuilder
      ]);
    } else {
      // Displaying Genre gridview if the search query is empty
      movieScreenState = MovieScreenState.genres;
      update([AppConstants.movieScreenListBuilder]);
    }
  }

  // Move detail screen
  openMoviePage(BuildContext context, movie_model.Movie movie) {
    pushNewScreen(
      context,
      screen: MovieDetailScreen(
        movie: movie,
      ),
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  // Open trailer screen
  watchTrailer(BuildContext context, int? movieId) async {
    final response = await _appRequests.getTrailer(movieId);
    if (response.statusCode == 200) {
      final youtubeId = jsonDecode(response.body)['results'].first['key'];
      youtubeVideoController = YoutubePlayerController(
        initialVideoId: youtubeId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: true,
        ),
      );
      Get.to(
        const TrailerVideo(),
      );
    }
  }

  @override
  void onInit() async {
    super.onInit();

    // Initializing local database
    _myDatabase = MyDatabase();

    directory = await getApplicationDocumentsDirectory();

    // Retrieving results from local database to display

    final moviesFromDatabase = await _myDatabase!.getAllMovies();

    // If the [Movies] table is not empty, movies are displayed from the local database
    // Meanwhile, the app will try to fetch results from the server
    // If results from the server match the cached results, then the list won't be updated
    // and the user will be shown the cached results

    if (moviesFromDatabase.isNotEmpty) {
      upcomingMovies = moviesFromDatabase
          .map((movie) => movie_model.Movie.fromDatabase(movie))
          .toList();
      movieLoadingState = MovieLoadingState.loadedFromCache;
      update([
        AppConstants.upcomingMoviesLoadingBuilder,
        AppConstants.movieScreenListBuilder
      ]);
    }

    // Calling api to update results
    final response = await _appRequests.getUpcomingMovies();

    if (response.statusCode == 200) {
      // Introducing an intermediate variable to see if the results from
      // server are different from the locally save results
      final moviesFromServer = jsonDecode(response.body)['results']
          .map((movie) {
            return movie_model.Movie.fromJson(movie);
          })
          .toList()
          .cast<movie_model.Movie>();

      // Saving image files to application directory
      // If results from the server do not match the cached results, then the list shall be updated
      // with the results from the server and older cached results should be replaced with the newer ones
      if (!AppConstants.equalLists(upcomingMovies, moviesFromServer)) {
        // If the results from the server are different from local results, displaying the
        // results from teh server and deleting the older entries
        upcomingMovies = moviesFromServer;

        // Replacing older cached data with new results
        await _myDatabase!.deleteMovies();
        await _myDatabase!.insertMultipleEntries(upcomingMovies);

        movieLoadingState = MovieLoadingState.loadedFromServer;
        update([
          AppConstants.upcomingMoviesLoadingBuilder,
          AppConstants.movieScreenListBuilder
        ]);
        await saveImages();
      }
    }
  }

  // Saving the network images as file in the application directory
  // Saving the relative path to the database, to regenerate their path when needed
  saveImages() async {
    for (movie_model.Movie movie in upcomingMovies) {
      final response = await _appRequests.getImage(movie.posterPath);
      if (response.statusCode == 200) {
        File file = File(directory!.path + movie.posterPath!);
        await file.writeAsBytes(response.bodyBytes);
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _myDatabase!.close();
  }
}
