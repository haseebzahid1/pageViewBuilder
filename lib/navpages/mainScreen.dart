import 'package:diccoverapp/misc/colors.dart';
import 'package:diccoverapp/widget/appLargeText.dart';
import 'package:diccoverapp/widget/appText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin{
  var image = {
    "balloning.png":"Balloning",
    "hiking.png":"Hiking",
    "kayaking.png":"Kayaking",
    "snorkling.png":"Snorkling",
};
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            const SizedBox(height: 30.0,),
            //discover text
            Container(
              margin: const EdgeInsets.only(left: 20.0),
                child: AppLargeApp(text: "Discover")
            ),
            const SizedBox(height: 20.0,),
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
              width: double.maxFinite,
              height: 250,
              padding: EdgeInsets.only(left: 20),
              child: TabBarView(
                controller: _tabController,
                children:  [
                  ListView.builder(
                    itemCount:3,
                      physics:BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return Container(
                        width: 200,
                        margin: EdgeInsets.only(right: 20,top: 10),
                        // height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: const DecorationImage(
                            image: AssetImage("assets/img/mountain.jpeg",),fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }
                  ),
                  Text("There"),
                  Text("By"),
                ],
              ),
            ),
            const SizedBox(height: 30.0,),
            Container(
              margin: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeApp(text: "Explore",size: 22,),
                  AppText(text: "See All",color: AppColors.textColor1,size: 18,),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
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
            ),
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
    final Offset circleoOffset = Offset(configuration.size!.width/2 -radius/2 , configuration.size!.height);
    canvas.drawCircle(offset+circleoOffset, radius, _paint );
  }

}