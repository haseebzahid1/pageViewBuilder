import 'package:diccoverapp/misc/colors.dart';
import 'package:diccoverapp/screens/appText.dart';
import 'package:flutter/material.dart';


class ResponsiveButton extends StatelessWidget {
  final double? width;
  final String? btnText;
  final bool? isResponsive;
  final String? imgPath;
  final void Function()?  btnTab;
  const ResponsiveButton({Key? key,
    this.width,this.isResponsive,
    this.imgPath,
    this.btnText, this.btnTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: btnTab,
      child: Container(
        width:width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imgPath!= null ?
            Image.asset(imgPath!) :
            AppText(text:btnText ?? "---", size: 22, color: Colors.white,),

          ],
        ),
      ),
    );
  }
}
