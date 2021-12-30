import 'package:flutter/material.dart';

import '../misc/colors.dart';
import 'appText.dart';

class ExploreListView extends StatelessWidget {
  const ExploreListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image = {
      "balloning.png":"Balloning",
      "hiking.png":"Hiking",
      "kayaking.png":"Kayaking",
      "snorkling.png":"Snorkling",
    };
    return Container(
      // color: Colors.red,
      height: 120,
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics:BouncingScrollPhysics(),
        itemCount: image.length,
        itemBuilder: (_, index){

          return Container(
            margin: EdgeInsets.only(right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image:  DecorationImage(
                      image: AssetImage("assets/img/"+image.keys.elementAt(index)),fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  child: AppText(
                    text:image.values.elementAt(index),
                    color: AppColors.textColor2,size: 16,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
