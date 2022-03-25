import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/src/constant/constants.dart';
import 'package:movie_app/src/mvc/controllers/movie_controller.dart';
import 'package:movie_app/src/mvc/models/movie_screen_states.dart';
import 'package:movie_app/src/style/style.dart';

class MovieListScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  const MovieListScreenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(110.0),
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
                  if (_movieController.movieScreenState !=
                      MovieScreenState.upcomingMovies) {
                    return TextField(
                      decoration: InputDecoration(
                        isCollapsed: true,
                        filled: true,
                        contentPadding: const EdgeInsets.all(10.0),
                        hintText: AppConstants.searchFieldHintText,
                        border: AppStyles.searchFieldBorder,
                        enabledBorder: AppStyles.searchFieldBorder,
                        focusedBorder: AppStyles.searchFieldBorder,
                        hintStyle:
                        const TextStyle(color: AppStyles.closeIconColor),
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
                      onChanged: _movieController.onSearchTextChanged,
                      onSubmitted: (query) => _movieController.search(context),
                    );
                  }
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppConstants.screenTitle,
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppStyles.appBarHeight);
}
