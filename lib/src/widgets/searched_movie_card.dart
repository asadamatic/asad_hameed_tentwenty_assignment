import 'package:flutter/material.dart';
import 'package:movie_app/src/constant/app_url.dart';
import 'package:movie_app/src/constant/constants.dart';
import 'package:movie_app/src/mvc/models/media.dart';
import 'package:movie_app/src/style/style.dart';

class SearchedMediaCard extends StatelessWidget {
  const SearchedMediaCard({Key? key, this.media}) : super(key: key);

  final Media? media;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppStyles.searchedMovieCardHeight,
      margin: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
              width: 130.0,
              decoration: BoxDecoration(
                borderRadius: AppStyles.movieImageRadius,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: media!.posterPath!.isNotEmpty
                        ? NetworkImage(AppUrl.movieImage + media!.posterPath!)
                        : const AssetImage('assets/themoviedb.jpeg')
                            as ImageProvider),
              )),
          const SizedBox(
            width: 25.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  media!.title!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: AppStyles.appBarTextColor,
                      fontSize: AppStyles.appBarTextSize),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  media!.genreIds!.isNotEmpty
                      ? AppConstants.genres[media!.genreIds?.first]?.name ??
                          'No Genre'
                      : 'No Genre',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: AppStyles.searchedMovieGenreTextColor,
                      fontSize: AppStyles.searchedMovieGenreTextSize),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
