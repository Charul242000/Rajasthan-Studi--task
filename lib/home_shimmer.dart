import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';
//This call will work as loader till our images nd videos gate display
//It is not a loader actually, but I have used it as an alternative till our data gets load
class HomeShimmer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context,int index){
            return Padding(
              padding: EdgeInsets.all(8),
              child: Shimmer.fromColors(child: ShimmerLayout(), baseColor: Colors.black12, highlightColor: context.theme.shadowColor),
            );
          }
      ),
    );
  }
}

class ShimmerLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 200,
      width: 258,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

}

