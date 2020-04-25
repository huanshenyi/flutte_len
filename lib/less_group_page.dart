import 'package:flutter/material.dart';
// StatelessWidgetの使用
class LessGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'StatelessWidgetの使用',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text(
          "StatelessWidgetの使用"
        ),),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text("I am Text",style: textStyle),
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
                    style: textStyle,
                  )
                ),
              ),
              AlertDialog(
                title: Text('i an alert'),
                content: Text("dadadadawdawdad"),
              )
            ],
          ),
        ),
      )
    );
  }
}
