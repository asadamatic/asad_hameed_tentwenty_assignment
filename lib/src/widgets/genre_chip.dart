import 'package:flutter/material.dart';
import 'package:movie_app/src/constant/constants.dart';
import 'package:movie_app/src/mvc/models/movie.dart';
import 'package:movie_app/src/style/style.dart';

class GenreChip extends StatelessWidget {
  const GenreChip({Key? key, required this.movie, required this.index})
      : super(key: key);

  final Movie? movie;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(AppStyles.genreChipRadius)),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Text(
        AppConstants.genres[movie!.genreIds![index!]]!.name!,
        style: const TextStyle(
            color: Colors.white, fontSize: AppStyles.overviewSize),
      ),
    );
  }
}
