import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppStyles {
  //Scaffold styles
  static const Color scaffoldBackgroundColor = Color(0xffF4F4F9);
  // Bottom NavigationBar styles
  static const double bottomNavBarRadius = 27.0;
  static const double iconSize = 16.0;

  static const Color bottomNavBarColor = Color(0xff2E2739);
  static const Color activeItemColorPrimary = Colors.white;
  static const Color inactiveItemColorPrimary = Color(0xff827D88);

  // Movies section, AppBar styles
  static const double appBarHeight = 110.0;
  static const double appBarTextSize = 20.0;
  static const double appBarIconSize = 16.0;
  static const double searchFieldRadius = 30.0;

  static const Color appbarBackgroundColor = Colors.white;
  static const Color appBarTextColor = Color(0xff202C43);
  static const Color closeIconColor = Color(0xff202C43);
  static const Color searchIconColor = Colors.black;
  static const Color searchFieldFillColor = Color(0xfff2f2f6);
  static const Color searchFieldBorderColor = Color(0xffefefef);

  static final InputBorder searchFieldBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: AppStyles.searchFieldBorderColor),
      borderRadius: BorderRadius.circular(AppStyles.searchFieldRadius));

  // Global Styles
  static final BorderRadius movieImageRadius = BorderRadius.circular(10.0);

  // Upcoming Movie card styles
  static const double upcomingMovieCardHeight = 200.0;
  static const double upcomingMovieTitleSize = 23.0;

  static const Color upcomingMovieTitleColor = Colors.white;

  static const LinearGradient upcomingMovieGradient = LinearGradient(
    colors: [
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.black
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0, 0.2, 0.65, 1],
  );

  // Searched movie card styles
  static const double searchedMovieCardHeight = 110.0;
  static const double searchedMovieGenreTextSize = 15.0;
  static const Color searchedMovieGenreTextColor = Color(0xffDBDBDF);

  // Genre card styles
  static const double genreTitleSize = 20.0;
  static final Color genreBackdropColor = Colors.black.withOpacity(0.45);

  // Movie detail screen styles
  static final LinearGradient movieDetailBackdropGradient = LinearGradient(
    colors: [
      Colors.transparent,
      Colors.transparent,
      Colors.black.withOpacity(0.5),
      Colors.black
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [0, 0.2, 0.7, 1],
  );
  static final DateFormat movieReleaseDateFormatter =
      DateFormat("MMMM dd, yyyy");

  static const double appBarExtendedHeight = 430.0;
  static const double appBarWidthPortrait = 350.0;

  static const double buttonWidthPortrait = 280.0;
  static const double buttonWidthLandscape = 140.0;

  static const Color buttonColor = Color(0xff61C3F2);
  static const Color overviewColor = Color(0xff8F8F8F);
  static const double overviewSize = 16.0;

  static const Color buttonTextColor = Colors.white;

  static const double genreChipRadius = 16.0;
}
