import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/src/constant/app_url.dart';
import 'package:movie_app/src/constant/constants.dart';
import 'package:movie_app/src/mvc/controllers/movie_controller.dart';
import 'package:movie_app/src/mvc/models/movie.dart';
import 'package:movie_app/src/mvc/models/movies_loading_state.dart';
import 'package:movie_app/src/style/style.dart';

class MoviePageAppBar extends StatelessWidget {
  const MoviePageAppBar({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    final MovieController _movieController = Get.find();
    return SliverAppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          AppConstants.screenTitle,
          style: TextStyle(fontSize: AppStyles.appBarTextSize),
        ),
        leading: IconButton(
            onPressed: () => _movieController.backToMovieListScreen(context),
            icon: const Icon(Icons.arrow_back_ios)),
        expandedHeight: AppStyles.appBarExtendedHeight,
        flexibleSpace: FlexibleSpaceBar(
          background: MovieDetailAppBarContent(
            movie: movie,
            height: AppStyles.appBarExtendedHeight,
            width: MediaQuery.of(context).size.width,
          ),
        ));
  }
}

class MovieDetailAppBarContent extends StatelessWidget {
  const MovieDetailAppBarContent(
      {Key? key,
      required this.movie,
      required this.height,
      required this.width})
      : super(key: key);

  final Movie? movie;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    final MovieController _movieController = Get.find();

    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: movie!.id!,
            child: Container(
              decoration: BoxDecoration(
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
                  gradient: AppStyles.movieDetailBackdropGradient),
            ),
          ),
          Positioned(
            bottom: 40.0,
            left: 10.0,
            right: 10.0,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${AppConstants.inTheaters} ${AppStyles.movieReleaseDateFormatter.format(movie!.releaseDate!)}',
                    style: const TextStyle(
                        color: AppStyles.upcomingMovieTitleColor,
                        fontSize: AppStyles.upcomingMovieTitleSize),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(
                      width: AppStyles.buttonWidth,
                      decoration: BoxDecoration(
                          color: AppStyles.buttonColor,
                          borderRadius: AppStyles.movieImageRadius),
                      child: TextButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(
                                  AppStyles.buttonTextColor),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(
                                      fontSize: AppStyles.appBarTextSize))),
                          onPressed: () {},
                          child: const Text(AppConstants.getTickets))),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(
                      width: AppStyles.buttonWidth,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: AppStyles.buttonColor),
                          borderRadius: AppStyles.movieImageRadius),
                      child: TextButton.icon(
                          icon: const Icon(
                            Icons.play_arrow,
                          ),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(
                                  AppStyles.buttonTextColor),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(
                                      fontSize: AppStyles.appBarTextSize))),
                          onPressed: () => _movieController.watchTrailer(
                              context, movie!.id!),
                          label: const Text(AppConstants.watchTrailer)))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
