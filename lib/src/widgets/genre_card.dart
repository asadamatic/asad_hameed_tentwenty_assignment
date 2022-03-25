import 'package:flutter/material.dart';
import 'package:movie_app/src/mvc/models/genre.dart';
import 'package:movie_app/src/style/style.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({Key? key, this.genre}) : super(key: key);

  final Genre? genre;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: AppStyles.movieImageRadius,
            image: DecorationImage(
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              image: AssetImage(genre!.image!),
            ),
          ),
          foregroundDecoration: BoxDecoration(
              borderRadius: AppStyles.movieImageRadius,
              color: AppStyles.genreBackdropColor),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              genre!.name!,
              style: const TextStyle(
                  fontSize: AppStyles.genreTitleSize,
                  color: AppStyles.upcomingMovieTitleColor),
            ),
          ),
        ),
      ],
    );
  }
}
