import 'package:movie_app/src/constant/app_url.dart';
import 'package:movie_app/src/constant/constants.dart';
import 'package:movie_app/src/services/http.dart';
import 'package:http/http.dart' as http;

class AppRequests {
  Future<http.Response> getUpcomingMovies() async {
    final response = await AppHttp()
        .getReq(AppUrl.upcomingMovies, query: {'api_key': AppConstants.apiKey});
    return response;
  }

  Future<http.Response> searchMovies(String? searchText) async {
    final response = await AppHttp().getReq(AppUrl.searchMedia, query: {
      'api_key': AppConstants.apiKey,
      'query': searchText,
      'include_adult': '0'
    });
    return response;
  }

  Future<http.Response> getImage(String? posterPath) async {
    final response = await AppHttp().getReq(AppUrl.movieImage + posterPath!);
    return response;
  }

  Future<http.Response> getTrailer(int? movieId) async {
    final response = await AppHttp()
        .getReq(AppUrl.movieTrailer + movieId!.toString() + '/videos', query: {
      'api_key': AppConstants.apiKey,
    });
    return response;
  }
}
