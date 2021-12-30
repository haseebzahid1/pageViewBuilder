import 'package:diccoverapp/misc/colors.dart';
import 'package:diccoverapp/widget/appText.dart';
import 'package:flutter/material.dart';


// class ResponsiveButton extends StatelessWidget {
//   final double? width;
//   final String? btnText;
//   final bool? isResponsive;
//   final String? imgPath;
//   final void Function()?  btnTab;
//   const ResponsiveButton({Key? key,
//     this.width,this.isResponsive,
//     this.imgPath,
//     this.btnText, this.btnTab,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: btnTab,
//       child: Container(
//         width:width,
//         height: 60,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: AppColors.mainColor,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             imgPath!= null ? Image.asset(imgPath!) : AppText(text:btnText ?? "---", size: 22, color: Colors.white,),
//             // imgPath!= null ? Image.asset(imgPath!) : AppText(text:btnText ?? "---", size: 22, color: Colors.white,),
//           ],
//         ),
//       ),
//     );
//   }
// }


class ResponsiveButton extends StatelessWidget {
  final double? width;
  final bool? isResponsive;
  const ResponsiveButton({Key? key,
    this.width= 120,
    this.isResponsive=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width:isResponsive==true?double.maxFinite:width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment:isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
          children: [
            isResponsive==true?Container(margin: EdgeInsets.only(left: 20),
                child: AppText(text: "Book Trip Now",color: Colors.white,size: 18,)):Container(),
            Image.asset("assets/img/button-one.png"),
          ],
        ),
      ),
    );
  }
}