import 'package:flutter/material.dart';
// Flutter layout
class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPage createState() => _FlutterLayoutPage();
}

class _FlutterLayoutPage extends State<FlutterLayoutPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Flutter layout",
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
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipOval( //円形
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                          "https://best-longstay.com/images/pokemon/illust/7/togedemaru.jpg"
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect( //正方形
                       borderRadius: BorderRadius.all(Radius.circular(10)),//10度の円角
                       child: Opacity(
                             opacity: 0.6,//透明度60%
                             child: Image.network(
                                 "https://best-longstay.com/images/pokemon/illust/7/togedemaru.jpg",
                                 width: 100,
                                 height: 100,
                             ),
                          )
                    ),
                  )
                ],
              ),
              TextField( //入力欄
                // 入力欄のスタイル
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    hintText: "何か入力して",
                    hintStyle: TextStyle(fontSize: 15)
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.all(10),
                child: PhysicalModel(color: Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                  clipBehavior: Clip.antiAlias,
                  child: PageView( //いわゆるswiper スライダー
                    children: <Widget>[
                      _item("page1", Colors.deepPurple),
                      _item("page2", Colors.green),
                      _item("page3", Colors.red)
                    ],
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  FractionallySizedBox( //幅maxを使用
                   widthFactor: 1,
                   child:Container(
                     decoration: BoxDecoration(color: Colors.greenAccent),
                     child: Text("幅max"),
                   ),
                  ),
                ],
              ),
              Stack( //要素が重ねる
                children: <Widget>[
                  Image.network( "https://best-longstay.com/images/pokemon/illust/7/togedemaru.jpg",height: 100,width: 100,),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Image.network( "https://best-longstay.com/images/pokemon/illust/7/togedemaru.jpg",height: 50,width: 50,),)
                ],
              )
            ],
          ),
          onRefresh: _handleRedresh,)
            : Text("listページです"),
      ),
    );
  }
  Future<Null>_handleRedresh() async{ //timeoutの設定
    await Future.delayed(Duration(microseconds: 200));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: TextStyle(fontSize: 22, color: Colors.white),),
    );
  }
}