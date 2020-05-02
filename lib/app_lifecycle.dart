import 'package:flutter/material.dart';

//Flutter Appレベルのライフサイクル
// WidgetsBindingObserver: Widgetsがバンド
class AppLifecycle extends StatefulWidget {
  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutterライフサイクル"),
        leading: BackButton(),
      ),
      body: Container(
        child: Text("flutterライフサイクル"),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("state = $state");
    if(state==AppLifecycleState.paused){
      print("Appバックエンドに入る");
    }else if(state == AppLifecycleState.resumed) {
      print("Appフロントに入る");
    }else if(state == AppLifecycleState.inactive){
      //あんまり使用しない、Appアクディームではない時、例え電話が来た時
    }
  }

  @override
  void dispose(){
    ///離れる際に削除、資源利用率がいい
    WidgetsBinding.instance.removeObserver(this);
   super.dispose();
  }
}
