import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../theme.dart';

class VideoCard extends StatelessWidget {
  Color color;
  VideoCard({this.color});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cardHeight = 0.35 * screenHeight;
    final cardWidth = 0.90 * screenWidth;

    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8.0),
          height: cardHeight,
          width: cardWidth,
          child: YoutubePlayer(
            context: context,
            videoId: "iLnmTe5Q2Qw",
            flags: YoutubePlayerFlags(
              autoPlay: true,
              showVideoProgressIndicator: true,
            ),
            videoProgressIndicatorColor: Colors.amber,
            progressColors: ProgressColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
            onPlayerInitialized: (controller) {
//              _controller = controller;
//              _controller.addListener(listener);
            },
          ),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          height: cardHeight,
          width: cardWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    color.withOpacity(0.65),
                    color.withOpacity(0.65),
                  ],
                  stops: [
                    0.0,
                    1.0
                  ])),
        ),
      ],
    );
  }
}
