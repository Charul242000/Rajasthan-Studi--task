import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rajasthani_studio_task/detail_pages/img_detail_pg.dart';
// This class is for Image UI, UI of the image list is designed here
class ImagesUI extends StatefulWidget {
//  Taking values from constructor
ImagesUI({required this.imgUrl,required this.artistName,this.id});
final String imgUrl;
final String artistName;
final id;
  @override
  _ImagesUIState createState() => _ImagesUIState();
}

class _ImagesUIState extends State<ImagesUI> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      child: Container(
          height: 250,
          width: 180,
          child: Column(
            children: [
               CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.red,
                   backgroundImage: NetworkImage(widget.imgUrl),


                  ),


              SizedBox(
                height: 10,
              ),
              Text("Artist: "+widget.artistName,style: TextStyle(fontSize: 15,color: Colors.white),)
            ],
          ),

      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ImgDetailPage(
          dartistName: widget.artistName,
          dimgUrl: widget.imgUrl,
        )));
      },
    );
  }
}
