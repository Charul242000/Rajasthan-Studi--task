import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:rajasthani_studio_task/gradient_color.dart';
import 'package:rajasthani_studio_task/home_shimmer.dart';
import 'package:rajasthani_studio_task/ui_screens/image_ui.dart';
import 'package:rajasthani_studio_task/ui_screens/videos_ui.dart';
//This is the dashboard where images and list will display
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}
late Map resultimg;
late Map resultvid;

class _DashboardState extends State<Dashboard> {
  List images=[];
  List videos=[];

  //below I have initialize fetchimage and fetchvideo methods
  void initState() {
    // TODO: implement initState

    super.initState();
    fetchimages();
    fetchvideos();
  }
  //Below are the functions for fetching data from api
  var resimg;
  var resvid;
  //This is for fetching images from api
  fetchimages() async {
    await http.get(Uri.parse('https://api.pexels.com/v1/curated'), headers: {
      'Authorization':
          '563492ad6f917000010000016c619ba264544072bce3fa7fbfc25201'
    }).then((value) {
      print(value.body);
      print('////////////////');
      resimg=jsonDecode(value.body);
      resultimg=resimg;
      setState(() {
        images=resultimg['photos'];
      });
      print(resultimg);
    });
  }
  //This function is for fetching videos from api
  fetchvideos() async {
    await http.get(Uri.parse('https://api.pexels.com/videos/popular'), headers: {
      'Authorization':
      '563492ad6f917000010000016c619ba264544072bce3fa7fbfc25201'
    }).then((value) {
      print(value.body);
      print('////////////////');
      resvid=jsonDecode(value.body);
      resultvid=resvid;
      setState(() {
        videos=resultvid['videos'];

      });
      print(resultvid);
    });
  }

  @override
  Widget build(BuildContext context) {
    var ressimg;
    var ressvid;
    //To check the network connectivity, I have used stream builder and inside it I have checked connectivity using connectivity package
    //If no internet connectivity it will show an image this text of no internet
    //otherwise it will display our dashboard
    return StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder:
            (BuildContext context, AsyncSnapshot<ConnectivityResult> snapshot) {
          if (snapshot != null &&
              snapshot.hasData &&
              snapshot.data != ConnectivityResult.none) {

           ressimg=resimg;
           ressvid=resvid;

            return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  title: Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 27),
                  ),
                  leading: Icon(CupertinoIcons.person),
                  actions: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(CupertinoIcons.heart),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                  backgroundColor: Colors.transparent,
                  elevation: 0.2,
                ),
                body: Stack(
                  children: [
                    GradientBackground(),
                    SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'Images',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //List view for images
                          Container(
                            height: 250,
                            width: double.infinity,
                            child: ressimg!=null?ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                itemBuilder: (context, index) => ImagesUI(
                                  imgUrl: images[index]['src']['tiny'],
                                  artistName: images[index]['photographer'],
                                  id: images[index]['photographer_id'],

                                )):HomeShimmer(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'Videos',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //Listview for videos
                          Container(
                            height: 300,
                            width: double.infinity,
                            child: ressvid!=null?ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                itemBuilder: (context, index) => VideosUI(
                                  vidImgUrl:videos[index]['image'],
                                  vidartistName:videos[index]['user']['name'] ,
                                  vidUrl: videos[index]['video_files'][index]['link'],

                                )):HomeShimmer(),
                          )
                        ],
                      ),
                    ),
                  ],
                ));
          } else {
            return Scaffold(
                body: Stack(
              children: [
                GradientBackground(),
                SafeArea(
                    child: Center(
                        child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                        height: 200,
                        width: 200,
                        child:
                            SvgPicture.asset('assets/images/no_internet.svg')),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Opps! No internet',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ))),
              ],
            ));
          }
        });
  }
}



