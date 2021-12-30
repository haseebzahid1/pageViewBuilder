import 'package:flutter/material.dart';

import '../misc/colors.dart';
import 'appLargeText.dart';
import 'appText.dart';


class ExploreTextWidget extends StatelessWidget {
  const ExploreTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20,right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppLargeApp(text: "Explore",size: 22,),
          AppText(text: "See All",color: AppColors.textColor1,size: 18,),
        ],
      ),
    );
  }
}
