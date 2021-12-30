import 'package:diccoverapp/modals/imgListItem.dart';
import 'package:flutter/material.dart';

import '../navpages/detailpage.dart';

class TabBarViewListBilder extends StatelessWidget {
   TabBarViewListBilder({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: blogLists.length,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index){
        BlogImage ListImgBlog = blogLists[index];
        return InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailPage(
              blogImgPath:ListImgBlog,
            )));
          },
          child: Container(
            width: 200,
            margin: EdgeInsets.only(right: 20,top: 10),
            // height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              image:  DecorationImage(
                image: AssetImage(ListImgBlog.imageUrl),fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
