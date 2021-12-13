import 'package:diccoverapp/misc/colors.dart';
import 'package:diccoverapp/widget/appLargeText.dart';
import 'package:diccoverapp/widget/appText.dart';
import 'package:diccoverapp/widget/app_button.dart';
import 'package:diccoverapp/widget/buttonWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final int gottenStars=4;
   int selectedIndex=-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [

            Positioned(
              left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/mountain.jpeg"),fit: BoxFit.cover,
                    ),
                  ),

                ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(onPressed: (){},
                    icon:const Icon(Icons.menu,color: Colors.white,),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 270,
              // left: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                width: MediaQuery.of(context).size.width,
                height: 500,////
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeApp(text: "Yosemite",color: Colors.black.withOpacity(0.8),),
                        AppLargeApp(text: "\$ 250",color: AppColors.mainColor),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.location_on,color:AppColors.mainColor,),
                        AppText(text: "USA, California",color: AppColors.textColor1,size: 18,),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index){
                            return Icon(Icons.star,color:index<gottenStars?AppColors.starColor:AppColors.textColor2);
                          }),
                        ),
                        AppText(text: "(4.0)",color: AppColors.textColor2,size: 18,),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    AppLargeApp(text: "People",color: Colors.black.withOpacity(0.8),size:20 ,),
                    const SizedBox(height: 5,),
                    AppText(text: "Number of people in your group",color: AppColors.mainColor,size: 18,),
                    const SizedBox(height:10),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: (){
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButton(
                              backgroundColor:selectedIndex==index?Colors.black:AppColors.buttonBackground, size: 50,
                              borderColor:selectedIndex==index?Colors.black:AppColors.buttonBackground,
                              color: selectedIndex==index?Colors.white:Colors.black,
                            text:(index+1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height:20),
                    Text("Description",style: TextStyle(fontSize: 20,color: Colors.black.withOpacity(0.8)),),
                    SizedBox(height: 10,),
                    AppText(text: "You must go for a travel. Travelling helps get fid of pressure.Go to the mountains to see the nature.",
                    color: AppColors.mainTextColor,size: 19,),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButton(color: AppColors.textColor1, backgroundColor: Colors.white, size: 60, borderColor: AppColors.textColor1,
                      isIcon:true,icon: Icons.favorite_border,),
                    SizedBox(width: 20,),
                    ResponsiveButton(
                      isResponsive: true,
                    ),
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}
