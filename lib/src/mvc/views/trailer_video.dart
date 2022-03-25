import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/src/mvc/controllers/movie_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerVideo extends StatelessWidget {
  const TrailerVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieController _movieController = Get.find();

    return YoutubePlayer(
      controller: _movieController.youtubeVideoController!,
      showVideoProgressIndicator: true,
      progressColors: const ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
      ),
      onEnded: (YoutubeMetaData youtubeMetaData) {
        Navigator.pop(context);
      },
    );
  }
}
