import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  final String videoID = 'wD9A6QADQnU';

  // VideoPage({this.videoID});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoID,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () {
          print('Player is ready.');
        },
      ),
    );
  }
}
