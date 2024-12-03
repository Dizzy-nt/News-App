import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';
import 'pages/about_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/detail': (context) => DetailPage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}
