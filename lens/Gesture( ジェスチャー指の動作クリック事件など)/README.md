# Gesture(指操作)

![images](../../lens/Gesture(%20ジェスチャー指の動作クリック事件など)/gesture.PNG)


### onTap: ()=> _printMsg("クリック"), // クリック
### onDoubleTap: ()=> _printMsg("ダブルクリック"), // ダブルクリック
### onLongPress: ()=> _printMsg("長押し"), // 長押し
### onTapCancel: ()=> _printMsg("クリック後キャンセル"), // クリック後、ボタンから指が離れる
### onTapUp: (e) => _printMsg("指離れた後の事件"),
### onTapDown: (e) => _printMsg("押したの事件"),


```dart
import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String printString = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
         primarySwatch: Colors.blue,
       ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("クリック事件"),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: [
              Column(
                children: [
                    GestureDetector(
                      onTap: ()=> _printMsg("クリック"), // クリック
                      onDoubleTap: ()=> _printMsg("ダブルクリック"), // ダブルクリック
                      onLongPress: ()=> _printMsg("長押し"), // 長押し
                      onTapCancel: ()=> _printMsg("クリック後キャンセル"), // クリック後、ボタンから指が離れる
                      onTapUp: (e) => _printMsg("指離れた後の事件"),
                      onTapDown: (e) => _printMsg("押したの事件"),
                      child: Container(
                        padding: EdgeInsets.all(60),
                        decoration: BoxDecoration(color: Colors.blueAccent),
                        child: Text(
                          "クリック",
                          style: TextStyle(fontSize: 36, color: Colors.white),
                        ),
                      ),
                    ),
                  Text(printString)
                ],
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
}
```

# 配置のWidget 例ボールの移動

### Positioned
Stack()の下階層でした使えない


```dart:
  double moveX = 0, moveY = 0;
...
              Positioned( //Stack()の下階層でした使えない
                // 指と動くボール
                left: moveX,
                top: moveY,
                child: GestureDetector(
                  onPanUpdate: (e)=> _doMove(e),
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(36)),
                  ),
                ),
              )

...
  _doMove(DragUpdateDetails e) {
    setState(() {
      moveX += e.delta.dx;
      moveY += e.delta.dy;
    });
  }
```