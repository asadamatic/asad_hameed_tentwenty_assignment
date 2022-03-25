import 'package:flutter/material.dart';
import 'package:movie_app/src/constant/constants.dart';
import 'package:movie_app/src/mvc/models/movie.dart';
import 'package:movie_app/src/mvc/views/fragments/movie_page_app_bar.dart';
import 'package:movie_app/src/style/style.dart';
import 'package:movie_app/src/widgets/genre_chip.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({Key? key, this.movie}) : super(key: key);

  final Movie? movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return Row(
            children: [
              MovieDetailAppBarContent(
                movie: movie,
                height: MediaQuery.of(context).size.height,
                width: AppStyles.appBarWidth,
              ),
              Flexible(child: ListView(children: bodyContent()))
            ],
          );
        }

        return CustomScrollView(
          slivers: [
            MoviePageAppBar(movie: movie),
            SliverList(
              delegate: SliverChildListDelegate(bodyContent()),
            )
          ],
        );
      }),
    );
  }

  List<Widget> bodyContent() {
    return [
      const Padding(
        padding: EdgeInsets.all(24.0),
        child: Text(
          AppConstants.genre,
          style: TextStyle(
              fontSize: AppStyles.appBarTextSize,
              color: AppStyles.appBarTextColor),
        ),
      ),
      Container(
        height: 36.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
            itemCount: movie!.genreIds!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GenreChip(
                  movie: movie,
                  index: index,
                )),
      ),
      const SizedBox(
        height: 25.0,
      ),
      const Padding(
        padding:
            EdgeInsets.only(bottom: 16.0, top: 24.0, left: 24.0, right: 20.0),
        child: Text(
          AppConstants.overview,
          style: TextStyle(
              fontSize: AppStyles.appBarTextSize,
              color: AppStyles.appBarTextColor),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 16.0, left: 24.0, right: 20.0),
        child: Text(
          movie!.overview!,
          style: const TextStyle(
              fontSize: AppStyles.overviewSize, color: AppStyles.overviewColor),
        ),
      ),
    ];
  }
}
