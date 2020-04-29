
import 'package:flutter/material.dart';

// StatefulWidgetのライフサイクル
// 初期化
// 1. createState、initState
// 更新
// 2. didChangeDependencies、build,didUpdateWidget
// デストロイ
// 3. deactivate、dispose
class WidgetLifecycle extends StatefulWidget {
  /// createState 新しいStatefulWidgetを構築時、最初呼ばれる
  /// 必ず書く必要があります
  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  int _count = 0;
  /// createStateの後呼ばれる
  /// AndroidのonCreate、IOSの viewDidLoad()に類似
  /// 初期化用のコード書く用、channelの初期化、watchの初期化など
  @override
  void initState() {
    print("===============initState================");
    super.initState();
  }
  /// State変わった時に呼ばれる
  /// a. 最初widget構築時、initState()後に呼ばれる
  /// b. もしStatefulWidgetsがInheritedWidgetに依頼する場合,InheritedWidget(データを伝達する用)
  @override
  void didChangeDependencies(){
    print("============didChangeDependencies=========");
    super.didChangeDependencies();
  }
  /// build必ず必要、
  /// didChangeDependenciesの後呼ばれる
  /// setStateの後も呼ばれる
  @override
  Widget build(BuildContext context) {
    print("=================build================");
    return Scaffold(
      appBar: AppBar(title: Text("Flutterライフサイクル"),
         leading: BackButton(),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: ()=>{
                setState((){
                  this._count += 1;
                })
              },child: Text("click", style: TextStyle(fontSize: 26),
             ),
            ),
            Text(_count.toString())
          ],
        ),
      ),

    );
  }
  /// あんまり使用しない、親widgetをbuildし直す時にだけ使用する。
  /// このメソッドはoldWidgetのパラメータを持ち、現在のwidgetと比較する時に何かを処理する
  /// if(oldWidget.xxx != widget.xxx)...
  @override
  void didUpdateWidget(WidgetLifecycle oldWidget) {
    print("----didUpdateWidget----");
    super.didUpdateWidget(oldWidget);
  }
  /// widget削除される(ページから離れる)前に呼ばれる
  @override
  void deactivate() {
    print("-----deactivate--------");
    super.deactivate();
  }
  /// deactivateの後
  /// widget削除される(ページから離れる)前に呼ばれる
  @override
  void dispose() {
    print("--------dispose---------");
    super.dispose();
  }
}
