import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/src/constant/constants.dart';
import 'package:movie_app/src/mvc/controllers/movie_controller.dart';
import 'package:movie_app/src/mvc/models/movie_screen_states.dart';
import 'package:movie_app/src/mvc/models/movies_loading_state.dart';
import 'package:movie_app/src/mvc/models/searching_state.dart';
import 'package:movie_app/src/mvc/views/fragments/movie_list_app_bar.dart';
import 'package:movie_app/src/widgets/genre_card.dart';
import 'package:movie_app/src/widgets/searched_movie_card.dart';
import 'package:movie_app/src/widgets/upcoming_movie_card.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MovieListScreenAppBar(),
      body: GetBuilder<MovieController>(
        id: AppConstants.movieScreenListBuilder,
        builder: (_movieController) {
          if (_movieController.movieScreenState == MovieScreenState.genres) {
            return GridView.count(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: AppConstants.genres.values
                    .toList()
                    .sublist(0, 18)
                    .map((genre) => GenreCard(
                          genre: genre,
                        ))
                    .toList());
          }
          if (_movieController.movieScreenState == MovieScreenState.search) {
            return GetBuilder<MovieController>(
                id: AppConstants.searchingMoviesLoadingBuilder,
                builder: (_movieController) {
                  if (_movieController.searchingState ==
                      SearchingState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemCount: _movieController.searchedMedia.length,
                      itemBuilder: (context, index) => SearchedMediaCard(
                            media: _movieController.searchedMedia[index],
                          ));
                });
          }
          return GetBuilder<MovieController>(
              id: AppConstants.upcomingMoviesLoadingBuilder,
              builder: (_movieController) {
                if (_movieController.movieLoadingState ==
                    MovieLoadingState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: _movieController.upcomingMovies.length,
                    itemBuilder: (context, index) => UpcomingMovieCard(
                          movie: _movieController.upcomingMovies[index],
                        ));
              });
        },
      ),
    );
  }
}

