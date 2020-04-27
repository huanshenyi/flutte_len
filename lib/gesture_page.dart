
import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String printString = "";
  double moveX = 0, moveY = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("ユーザーの手つきとクリックイベント処理"),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column (
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _printMsg("click"),
                    onDoubleTap: () => _printMsg("DoubleClick"),
                    onLongPress: () => _printMsg("長押し"),
                    onTapCancel: () => _printMsg("キャンセル"),
                    onTapUp: (e) => _printMsg("押し離れる"),
                    onTapDown: (e) => _printMsg("押した"),
                    child: Container(
                      padding: EdgeInsets.all(60),
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Text(
                        "ClickeMe",
                        style: TextStyle(fontSize: 30, color: Colors.white),),
                    ),
                  ),
                  Text(this.printString)//手つき処理(クリック)
                ],
              ),
              Positioned(
                left: moveX,
                top: moveY,
                child: GestureDetector( //移動するためによく使う
                  onPanUpdate: (e) => _doMove(e), //移動距離イベント
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(36)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _printMsg(String msg) {
    setState(() {
      printString += " ,$msg";
    });
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      moveY += e.delta.dy;
      moveX += e.delta.dx;
    });
    print(e);
  }
}
