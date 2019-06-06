import 'package:flutter/material.dart';

// import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './HotMoviesListWidget.dart';
import '../../bloc/CityBloc.dart';

class HotWidget extends StatefulWidget {
  HotWidget({Key key}) : super(key: key);

  _HotWidgetState createState() => _HotWidgetState();
}

class _HotWidgetState extends State<HotWidget> {
  String curCity = '深圳';

  // void initData() async {
  //   // 从本地缓存读取上次选择的城市
  //   final prefs = await SharedPreferences.getInstance();

  //   String city = prefs.getString('curCity');

  //   if (city != null && city.isNotEmpty) {
  //     setState(() {
  //       curCity = city;
  //     });
  //   } else {
  //     setState(() {
  //       curCity = '深圳';
  //     });
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initData();
  }

  @override
  Widget build(BuildContext context) {
    // 在 HotWidget 里使用 BlocBuilder 监听 CityBloc：
    // return BlocBuilder(
    //   bloc: BlocProvider.of<CityBloc>(context),
    //   builder: (context, CityState cityState) {
    //     return Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: <Widget>[
    //         Container(
    //           height: 80.0,
    //           alignment: Alignment.bottomCenter,
    //           padding: EdgeInsets.only(left: 20, right: 20),
    //           child: Row(
    //             children: <Widget>[
    //               GestureDetector(
    //                 child: Text(
    //                   BlocProvider.of<CityBloc>(context).currentState.curCity,
    //                   style: TextStyle(fontSize: 16),
    //                 ),
    //                 onTap: () async {
    //                   var selectCity = await Navigator.pushNamed(context, '/Citys', arguments: BlocProvider.of<CityBloc>(context).currentState.curCity);
    //                   if (selectCity == null) {
    //                     return;
    //                   }

    //                   // // 把选择的城市缓存在本地
    //                   // final prefs = await SharedPreferences.getInstance();
    //                   // prefs.setString('curCity', selectCity);

    //                   // setState(() {
    //                   //   curCity = selectCity;
    //                   // });
    //                   BlocProvider.of<CityBloc>(context).dispatch(CityEvent(selectCity));
    //                 },
    //               ),
    //               Icon(Icons.arrow_drop_down),
    //               Expanded(
    //                 flex: 1,
    //                 child: TextField(
    //                   textAlign: TextAlign.center,
    //                   style: TextStyle(fontSize: 16),
    //                   decoration: InputDecoration(
    //                     hintText: '\uE8b6 电影 / 电视剧 / 影人',
    //                     hintStyle: TextStyle(fontFamily: 'MaterialIcons', fontSize: 16),
    //                     contentPadding: EdgeInsets.only(top: 8, bottom: 8),
    //                     border: OutlineInputBorder(
    //                       borderSide: BorderSide.none,
    //                       borderRadius: BorderRadius.all(Radius.circular(5))
    //                     ),
    //                     filled: true,
    //                     fillColor: Colors.black12
    //                   ),
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //         Expanded(
    //           flex: 1,
    //           child: DefaultTabController(
    //             length: 2,
    //             child: Column(
    //               children: <Widget>[
    //                 Container(
    //                   constraints: BoxConstraints.expand(height: 50),
    //                   child: TabBar(
    //                     unselectedLabelColor: Colors.black12,
    //                     labelColor: Colors.black87,
    //                     indicatorColor: Colors.black87,
    //                     tabs: <Widget>[Tab(text: '正在热映'), Tab(text: '即将上映')],
    //                   ),
    //                 ),
    //                 Expanded(
    //                   child: Container(
    //                     child: TabBarView(
    //                       children: <Widget>[
    //                         HotMoviesListWidget(BlocProvider.of<CityBloc>(context).currentState.curCity),
    //                         Center(child: Text('即将上映')),
    //                       ],
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         )
    //       ],
    //     );
    //   },
    // );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 80.0,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: <Widget>[
              GestureDetector(
                child: Text(
                  curCity,
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () async {
                  var selectCity = await Navigator.pushNamed(context, '/Citys',
                      arguments: curCity);
                  if (selectCity == null) {
                    return;
                  }

                  // // 把选择的城市缓存在本地
                  // final prefs = await SharedPreferences.getInstance();
                  // prefs.setString('curCity', selectCity);

                  setState(() {
                    curCity = selectCity;
                  });
                  // BlocProvider.of<CityBloc>(context)
                  //     .dispatch(CityEvent(selectCity));
                },
              ),
              Icon(Icons.arrow_drop_down),
              Expanded(
                flex: 1,
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      hintText: '\uE8b6 电影 / 电视剧 / 影人',
                      hintStyle:
                          TextStyle(fontFamily: 'MaterialIcons', fontSize: 16),
                      contentPadding: EdgeInsets.only(top: 8, bottom: 8),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      filled: true,
                      fillColor: Colors.black12),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(height: 50),
                  child: TabBar(
                    unselectedLabelColor: Colors.black12,
                    labelColor: Colors.black87,
                    indicatorColor: Colors.black87,
                    tabs: <Widget>[Tab(text: '正在热映'), Tab(text: '即将上映')],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(
                      children: <Widget>[
                        HotMoviesListWidget(curCity),
                        Center(child: Text('即将上映')),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
