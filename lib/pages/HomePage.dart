import 'package:flutter/material.dart';
import 'package:imitate_douban_flutter/bloc/CityBloc.dart';

import './hot/HotWidget.dart';
import './movies/MoviesWidget.dart';
import './mine/MineWidget.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0; // 导航栏选中的Index

  // final _widgetItems = [Text('热映'), Text('找片'), Text('我的')];
  final _navigationWidgetItem = [HotWidget(), MoviesWidget(), MineWidget()];

  // 点击导航栏项的事件
  void _onNaviItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // 刷新页面
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _navigationWidgetItem[_selectedIndex], // 选中不同的选项显示不同的界面,
      // 给子 Widget 注入 CityBloc
      // body: BlocProvider<CityBloc>(
      //   bloc: CityBloc(),
      //   child: _navigationWidgetItem[_selectedIndex],
      // ),
      // 底部Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('热映')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.panorama_fish_eye),
            title: Text('找片')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('我的')
          )
        ],
        currentIndex: _selectedIndex,  // 默认选中的Index
        fixedColor: Colors.black, // 选中时的颜色
        type: BottomNavigationBarType.fixed,  // 类型为fixed
        onTap: _onNaviItemTapped,
      ),
    );
  }
}
