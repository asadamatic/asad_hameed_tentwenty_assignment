import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/src/constant/constants.dart';
import 'package:movie_app/src/mvc/controllers/movie_controller.dart';
import 'package:movie_app/src/mvc/models/movie_screen_states.dart';
import 'package:movie_app/src/style/style.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110.0),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    top: 25.0, bottom: 15.0, right: 15.0, left: 20.0),
                child: GetBuilder<MovieController>(
                    id: AppConstants.movieScreenStateBuilder,
                    builder: (_movieController) {
                      // if (_movieController.movieScreenState ==
                      //     MovieScreenState.searched) {
                      //   return Row(
                      //     children: [
                      //       IconButton(
                      //         icon: const Icon(Icons.arrow_back_ios),
                      //         onPressed:
                      //             _movieController.backFromSearchedScreen,
                      //       ),
                      //       const Text(
                      //         '3 Results found',
                      //         style: TextStyle(
                      //             color: AppStyles.appBarTextColor,
                      //             fontSize: AppStyles.appBarTextSize),
                      //       ),
                      //     ],
                      //   );
                      // }
                      if (_movieController.movieScreenState ==
                              MovieScreenState.genres ||
                          _movieController.movieScreenState ==
                              MovieScreenState.search) {
                        return TextField(
                          focusNode: _movieController.focusNode,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            filled: true,
                            contentPadding: const EdgeInsets.all(10.0),
                            hintText: "TV shows, movies and more",
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppStyles.searchFieldBorderColor),
                                borderRadius: BorderRadius.circular(
                                    AppStyles.searchFieldRadius)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppStyles.searchFieldBorderColor),
                                borderRadius: BorderRadius.circular(
                                    AppStyles.searchFieldRadius)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppStyles.searchFieldBorderColor),
                                borderRadius: BorderRadius.circular(
                                    AppStyles.searchFieldRadius)),
                            hintStyle: const TextStyle(
                                color: AppStyles.closeIconColor),
                            suffixIcon: IconButton(
                              alignment: Alignment.centerRight,
                              color: AppStyles.closeIconColor,
                              icon: const Icon(Icons.clear),
                              onPressed: _movieController.endSearch,
                            ),
                            prefixIcon: IconButton(
                              alignment: Alignment.centerRight,
                              color: AppStyles.closeIconColor,
                              icon: const Icon(Icons.search),
                              onPressed: () => _movieController.search(context),
                            ),
                            fillColor: AppStyles.searchFieldFillColor,
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          textInputAction: TextInputAction.search,
                          style: const TextStyle(
                              color: AppStyles.appBarTextColor, fontSize: 16.0),
                          onChanged: _movieController.onSearchTextChange,
                          // onSubmitted: (query) => onSearchQueryUpdated!(query),
                          // onEditingComplete: () => onEditingComplete!,
                        );
                      }
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Watch',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppStyles.appBarTextColor,
                              fontSize: AppStyles.appBarTextSize,
                            ),
                          ),
                          IconButton(
                              onPressed: _movieController.startSearch,
                              icon: const Icon(Icons.search))
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      body: GetBuilder<MovieController>(
        id: AppConstants.movieScreenListBuilder,
        builder: (_movieController) {
          return Center(
            child: Text(_movieController.movieScreenState.toString()),
          );
        },
      ),
    );
  }
}
