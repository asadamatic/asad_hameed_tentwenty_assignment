import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/src/constant/app_url.dart';
import 'package:movie_app/src/constant/constants.dart';
import 'package:movie_app/src/mvc/controllers/movie_controller.dart';
import 'package:movie_app/src/mvc/models/movie.dart';
import 'package:movie_app/src/mvc/models/movies_loading_state.dart';
import 'package:movie_app/src/style/style.dart';

class UpcomingMovieCard extends StatelessWidget {
  const UpcomingMovieCard({Key? key, this.movie}) : super(key: key);
  final Movie? movie;
  @override
  Widget build(BuildContext context) {
    final MovieController _movieController = Get.find();

    return InkWell(
      onTap: () => _movieController.openMoviePage(context, movie!),
      child: Container(
        height: AppStyles.upcomingMovieCardHeight,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: AppStyles.movieImageRadius,
        ),
        child: Stack(
          fit: StackFit.loose,
          children: [
            GetBuilder<MovieController>(
              id: AppConstants.upcomingMoviesLoadingBuilder,
              builder: (_movieController) => Hero(
                tag: movie!.id!,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: AppStyles.movieImageRadius,
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        fit: BoxFit.fitWidth,
                        image: _movieController.movieLoadingState ==
                                MovieLoadingState.loadedFromCache
                            ? FileImage(File(_movieController.directory!.path +
                                movie!.posterPath!))
                            : NetworkImage(
                                AppUrl.movieImage + movie!.posterPath!,
                              ) as ImageProvider),
                  ),
                  foregroundDecoration: BoxDecoration(
                      borderRadius: AppStyles.movieImageRadius,
                      gradient: AppStyles.upcomingMovieGradient),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  movie!.title!,
                  style: const TextStyle(
                      color: AppStyles.upcomingMovieTitleColor,
                      fontSize: AppStyles.upcomingMovieTitleSize),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
