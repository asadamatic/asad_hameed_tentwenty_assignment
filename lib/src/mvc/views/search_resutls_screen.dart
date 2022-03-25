import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/src/mvc/controllers/movie_controller.dart';
import 'package:movie_app/src/style/style.dart';
import 'package:movie_app/src/widgets/searched_movie_card.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieController _movieController = Get.find();

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppBar(
                leading: IconButton(
                    onPressed: () =>
                        _movieController.backToMovieListScreen(context),
                    icon: const Icon(Icons.arrow_back_ios)),
                backgroundColor: AppStyles.appbarBackgroundColor,
                automaticallyImplyLeading: true,
                foregroundColor: AppStyles.appBarTextColor,
                title: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                        '${_movieController.searchedMedia.length} Results Found')),
              ),
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: _movieController.searchedMedia.length,
            itemBuilder: (context, index) => SearchedMediaCard(
                  media: _movieController.searchedMedia[index],
                )),
      ),
    );
  }
}
