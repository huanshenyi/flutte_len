import 'package:flutter/material.dart';
// StateFullWidgetの使用
class StateFullGroup extends StatefulWidget {
  @override
  _StateFullGroupState createState() => _StateFullGroupState();
}

class _StateFullGroupState extends State<StateFullGroup> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "StateFullWidgetの使用",
      home: Scaffold(
        appBar: AppBar(title: Text("StateFullWidgetの使用"), backgroundColor: Colors.orange,),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
            onTap: (index){ //itemのクリックイベント
               setState(() {
                 this._currentIndex = index;
               });
            },
            items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.green,),
            activeIcon: Icon(Icons.home, color: Colors.blue,),
            title: Text("home")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.green,),
              activeIcon: Icon(Icons.list, color: Colors.blue,),
            title: Text("list")
          )
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text("click"),
        ),
        body: this._currentIndex == 0
            ? RefreshIndicator( //リロードの内部ListViewである必要があります
               child: ListView(
                 children: <Widget>[
                   Container(
                     decoration: BoxDecoration(color: Colors.white),
                     alignment: Alignment.center,
                     child: Column(
                       children: <Widget>[
                         Text("I am Text",style: TextStyle(color: Colors.blue)),
                         Icon(Icons.android, size: 50, color: Colors.red,),
                         CloseButton(),
                         BackButton(),
                         Chip(
                           avatar: Icon(Icons.flare, color: Colors.white,),
                           label: Text("  火  ", style: TextStyle(color: Colors.white),),
                           backgroundColor: Colors.red,
                         ),
                         Divider( //分割線
                           height: 10, //コンテナの高さ
                           indent: 10, //左側への距離
                           color: Colors.orange,
                         ),
                         Card(
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40.0))), //圓角
                           color: Colors.blue,
                           elevation: 5,//シャドウ
                           margin: EdgeInsets.all(10), //上下左右10
                           child: Container(
                               padding: EdgeInsets.all(10),
                               child: Text(
                                 "I am Card",
                                 style: TextStyle(color: Colors.blue),
                               )
                           ),
                         ),
                         AlertDialog(
                           title: Text('i an alert'),
                           content: Text("dadadadawdawdad"),
                         )
                       ],
                     ),
                   )
                 ],
               ), onRefresh: _handleRedresh,)
            : Text("listページです"),
      ),
    );
  }
  Future<Null>_handleRedresh() async{ //timeoutの設定
    await Future.delayed(Duration(microseconds: 200));
    return null;
  }
}