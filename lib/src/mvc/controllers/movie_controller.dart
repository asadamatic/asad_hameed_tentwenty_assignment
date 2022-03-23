import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app/src/constant/constants.dart';
import 'package:movie_app/src/mvc/models/movie_screen_states.dart';
import 'package:movie_app/src/mvc/views/search_resutls_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MovieController extends GetxController {
  // Navigation Bar
  PersistentTabController controller = PersistentTabController(initialIndex: 1);

  // Movie Screen States
  MovieScreenState movieScreenState = MovieScreenState.upcomingMovies;

  String? searchText = '';
  FocusNode focusNode = FocusNode();

  onSearchTextChange(String? newSearchText) {}

  startSearch() {
    movieScreenState = MovieScreenState.search;
    update([AppConstants.movieScreenStateBuilder, AppConstants.movieScreenListBuilder]);
  }

  endSearch() {
    movieScreenState = MovieScreenState.upcomingMovies;
    update([AppConstants.movieScreenStateBuilder, AppConstants.movieScreenListBuilder]);
  }

  search(BuildContext context){
    pushNewScreen(
      context,
      screen: const SearchResultsScreen(),
      withNavBar: true,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );

  }
  backFromSearchedScreen(){

  }
}
