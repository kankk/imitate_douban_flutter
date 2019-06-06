import 'package:flutter/material.dart';

import './pages/HomePage.dart';

import './citys/CitysWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: '豆瓣电影'),
      routes: {
        '/Citys': (context) => CitysWidget(),
      },
    );
  }
}