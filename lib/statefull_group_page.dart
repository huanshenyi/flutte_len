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
        appBar: AppBar(title: Text("StateFullWidgetの使用"), backgroundColor: Colors.orange,
          leading: GestureDetector( //左側のwidget
            onTap: (){
               Navigator.pop(context); //現在のページから脱出
            },
          child: Icon(Icons.arrow_back),
        )),
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
                   Image.network(
                       "https://lh3.googleusercontent.com/OQicdb5sirirCCTLq2Z1J4tR_lU1DuYi7NMlaGvYBIYoi9jUuhI2Li4U_P3PDB1C4VcKtCLIoxyZX6EWPqeSfAgire5ktt0=s520-c",
                     width: 100,
                     height: 100,
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
                       margin: EdgeInsets.only(top: 10),
                     decoration: BoxDecoration(color: Colors.lightGreenAccent),
                     child: PageView( //いわゆるswiper スライダー
                       children: <Widget>[
                         _item("page1", Colors.deepPurple),
                         _item("page2", Colors.green),
                         _item("page3", Colors.red)
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

  _item(String title, Color color) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: TextStyle(fontSize: 22, color: Colors.white),),
    );
  }
}