import 'package:diccoverapp/navpages/search_page.dart';
import 'package:flutter/material.dart';

import 'bar_item_page.dart';
import 'mainScreen.dart';
import 'my_page.dart';
class MainPageState extends StatefulWidget {
  const MainPageState({Key? key}) : super(key: key);

  @override
  State<MainPageState> createState() => _MainPageStateState();
}

class _MainPageStateState extends State<MainPageState> {
  List pages = [
    MainScreen(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int currentIndex = 0;
  void onTab(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar (
          unselectedFontSize: 0, ///note
          selectedFontSize: 0,   ///note
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          // onTap: (int index){
          //   setState(() {
          //     currentIndex = index;
          //   });
          // },
          onTap: onTab,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(label: "Home",icon:Icon(Icons.apps)),
            BottomNavigationBarItem(label: "Bar",icon:Icon(Icons.bar_chart_sharp)),
            BottomNavigationBarItem(label: "Search",icon:Icon(Icons.search)),
            BottomNavigationBarItem(label: "My",icon:Icon(Icons.person)),
          ],
        )
    );
  }
}
