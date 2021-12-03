import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class YoutubeData {
  const YoutubeData({required this.title, required this.videoId});
  final String title;
  final String videoId;
}

class PlayYoutubeVideo extends StatelessWidget {
  static const routeName = '/PlayYoutubeVideo';
  
  const PlayYoutubeVideo({
    Key? key,
    required this.youtubeData,
  }) : super(key: key);

  final YoutubeData youtubeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(youtubeData.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: YoutubePlayerBuilder(
              builder: (ctx, player) {
                return player;
              },
              player: YoutubePlayer(
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blue,
                progressColors: ProgressBarColors(
                  playedColor: Theme.of(context).primaryColorLight,
                ),
                controller: YoutubePlayerController(
                    initialVideoId:
                        YoutubePlayer.convertUrlToId(youtubeData.videoId)!,
                    flags: YoutubePlayerFlags(
                        isLive: false, autoPlay: true, enableCaption: false,),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
