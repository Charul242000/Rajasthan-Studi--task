import 'package:better_player/better_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rajasthani_studio_task/gradient_color.dart';
//This is the detail page for videos, when user click on the video, this page will open
class VideoDetail extends StatefulWidget {
  // Taking values through constructor
  VideoDetail({required this.videourl, required this.name});
  final String videourl;
  final String name;
  @override
  _VideoDetailState createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          GradientBackground(),

          SingleChildScrollView(
            child: Column(
              children: [
                BetterPlayer.network(
                  widget.videourl,
                  betterPlayerConfiguration: BetterPlayerConfiguration(
                    aspectRatio: 16/9,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                    child: Text(
                  "Artist: " + widget.name,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )),
                SizedBox(
                  height: 30,
                ),
                Center(
                    child: Text(
                  "Video from Pexels",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
