import 'package:diccoverapp/misc/colors.dart';
import 'package:diccoverapp/widget/appLargeText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu text
          Container(
            margin: EdgeInsets.only(top:70,left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Icon(Icons.menu,size: 30,color: Colors.black,),
                // Expanded(child: Container()),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40.0,),
          //discover text
          Container(
            margin: const EdgeInsets.only(left: 20.0),
              child: AppLargeApp(text: "Discover")
          ),
          const SizedBox(height: 40.0,),
          //tabbar
          Container(
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
          Container(
            height: 300,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: const [
                Text("Hi"),
                Text("There"),
                Text("By"),
              ],
            ),
          ),
        ],
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
    // TODO: implement createBoxPainter
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
    final Offset circleoOffset = Offset(configuration.size!.width/2,0);
    canvas.drawCircle(offset+circleoOffset, radius, _paint );
  }

}