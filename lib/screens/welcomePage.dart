import 'package:diccoverapp/misc/colors.dart';
import 'package:diccoverapp/navpages/mainScreen.dart';
import 'package:diccoverapp/widget/buttonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widget/appLargeText.dart';
import '../widget/appText.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "assets/img/welcome-one.png",
    "assets/img/welcome-two.png",
    "assets/img/welcome-three.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          // scrollDirection:Axis.horizontal,
          scrollDirection:Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(images[index]),fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(top:150,left: 20,right: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        AppLargeApp(text: 'Trips',) ,
                        AppText(text: 'Mountain',size: 30,),
                        SizedBox(height: 20.0,),

                        Container(
                          width: 254   ,
                          child: AppText(text: 'Mountain hikes give your an incredible sense of freedom along with ecdurange test',
                            size: 15,color: AppColors.textColor2,),
                        ),
                        const SizedBox(height: 40.0,),
                         InkWell(
                           onTap: (){
                             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainScreen()));
                           },
                             child: ResponsiveButton(width: 120,)
                         ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(3, (indexx){
                                    return Container(
                                      margin: EdgeInsets.only(left: 9),
                                      width:index == indexx?30:16,
                                      height: 16 ,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.0),
                                        color:index == indexx?Colors.red:Colors.orange,
                                      ),

                                    );
                                  }),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(width: 80.0,),
                    Column(children: List.generate(3,(indexDots){
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            width: 8,
                            height: index == indexDots?25:8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color:index == indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3),
                            ),
                          );
                        }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
