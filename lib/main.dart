import 'package:diccoverapp/screens/welcomePage.dart';
import 'package:flutter/material.dart';

import 'navpages/main_page.dart';
import 'navpages/my_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPageState(),
      // home: const WelcomePage(),
    );
  }
}
