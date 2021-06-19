import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rajasthani_studio_task/detail_pages/video_detail_pg.dart';
// This class is for video UI, UI of the video list is designed here
class VideosUI extends StatefulWidget {
  VideosUI({required this.vidImgUrl,required this.vidartistName,required this.vidUrl});
  final String vidImgUrl;
  final String vidartistName;
  final String vidUrl;

  @override
  _VideosUIState createState() => _VideosUIState();
}

class _VideosUIState extends State<VideosUI> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoDetail(videourl:widget.vidUrl, name:widget.vidartistName)));
        },
        child: Container(
          height: 300,
          width: 258,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Container(
                height: 200,
                width: 258,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:  NetworkImage(widget.vidImgUrl),
                    fit: BoxFit.fill
                  ),

                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(CupertinoIcons.play_fill,color: Colors.red,),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Artist: '+widget.vidartistName,
                  style: TextStyle(fontSize: 15,color: Colors.white)
              )
            ],
          ),
        ),
      ),
    );
  }
}
