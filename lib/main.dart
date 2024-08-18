import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'package:sizer/sizer.dart';

/*
CODE BY Hmida71 Github
Site Web https://hmida71.netlify.app
For any service text me on instagram : hmida_._071 -- https://www.instagram.com/hmida_._071
*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          title: 'Instagram Redesign Web By Hmida71 🌟',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: const Home());
    });
  }
}
