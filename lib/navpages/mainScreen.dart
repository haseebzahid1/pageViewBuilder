import 'dart:core';

import 'package:diccoverapp/misc/colors.dart';
import 'package:diccoverapp/widget/appLargeText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/arrow_button_widget.dart';
import '../widget/explore_listview_builder.dart';
import '../widget/explore_text_widget.dart';
import '../widget/tabbar_view_listview_builder_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //menu text
            const ExploreWithHeaderButton(),
            const SizedBox(height: 30.0,),
            //discover text
            Container(
              margin: const EdgeInsets.only(left: 20.0),
                child: AppLargeApp(text: "Discover")
            ),
            const SizedBox(height: 20.0,),
            //tabbar
          Row(
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: Container(
                  child:Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: EdgeInsets.only(left: 20,right: 20),
                      labelColor: Colors.black54,
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      controller: _tabController,
                      indicator:CircleTabIndicator(color: AppColors.mainColor, radius: 4) ,
                      tabs: const [
                        Tab(text: "Places"),
                        Tab(text: "Inspiration",),
                        Tab(text: "Emotions",),
                      ],
                    ),
                  ),
                ),
              ),
              //tabbarView
              Flexible(
                child: Container(
                  width: double.maxFinite,
                  height: 250,
                  padding: EdgeInsets.only(left: 20),
                  child: TabBarView(
                    controller: _tabController,
                    children:  [
                      TabBarViewListBilder(),
                      Text("There"),
                      Text("By"),
                    ],
                  ),
                ),
              ),
            ],
          ),///Tabbar & TabBarView
            const SizedBox(height: 30.0,),
            const ExploreTextWidget(),
            const SizedBox(height: 10,),
            const ExploreListView(),
          ],
        ),
      ),
    );
  }
}


class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color , required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {

    return _CirclePainter(radius: radius, color: color);
  }

}

class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color , required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color=color;
    _paint.isAntiAlias = true;
    final Offset circleoOffset = Offset(configuration.size!.width/2 -radius/2 , configuration.size!.height-40);
    canvas.drawCircle(offset+circleoOffset, radius, _paint );
  }

}