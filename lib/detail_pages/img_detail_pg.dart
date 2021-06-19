import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rajasthani_studio_task/gradient_color.dart';
import 'package:velocity_x/velocity_x.dart';

// This is the detail page for images, when user click on the image, this page will open
class ImgDetailPage extends StatefulWidget {
  // Taking values through constructor
  ImgDetailPage({required this.dimgUrl, required this.dartistName, this.did});
  final String dimgUrl;
  final String dartistName;
  final did;
  @override
  _ImgDetailPageState createState() => _ImgDetailPageState();
}

class _ImgDetailPageState extends State<ImgDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GradientBackground(),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  VxArc(
                    height: 30,
                    arcType: VxArcType.CONVEX,
                    edge: VxEdge.BOTTOM,
                    child: Container(
                      width: context.screenWidth,
                      height: 500,
                      decoration: BoxDecoration(
                          color: Color(0xFF15042e),
                          image: DecorationImage(
                              image: NetworkImage(widget.dimgUrl),
                              fit: BoxFit.cover)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            child: Icon(
                              CupertinoIcons.arrow_left,
                              size: 30,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                      child: Text(
                    "Artist: " + widget.dartistName,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                      child: Text(
                    "Image from Pexels",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
