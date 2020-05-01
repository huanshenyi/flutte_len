import 'package:flutter/material.dart';
import 'package:flutter_len/app_lifecycle.dart';
import 'package:flutter_len/flutter_layout_page.dart';
import 'package:flutter_len/flutter_widget_lifecycle.dart';
import 'package:flutter_len/gesture_page.dart';
import 'package:flutter_len/launch_page.dart';
import 'package:flutter_len/less_group_page.dart';
import 'package:flutter_len/plugin_use.dart';
import 'package:flutter_len/res_page.dart';
import 'package:flutter_len/statefull_group_page.dart';

void main() => runApp(DynamicTheme());

class DynamicTheme extends StatefulWidget {
  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness = Brightness.light;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          //夜間モード
          brightness: this._brightness,
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Flutterのルート使用"),
          ),
          body: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("モードチェンジ", style: TextStyle(fontSize: 20),),
                onPressed: (){
                  setState(() {
                    if(_brightness == Brightness.dark){
                      _brightness = Brightness.light;
                    }else{
                      _brightness = Brightness.dark;
                    }
                  });
                },
              ),
              RouteNavigator()
            ],
          ),
        ),
        routes: <String, WidgetBuilder>{ //ルート別名定義
          "plugin": (BuildContext context) => PluginUse(),
          "less":(BuildContext context) => LessGroupPage(),
          "ful":(BuildContext context) => StateFullGroup(),
          "layout":(BuildContext context) => FlutterLayoutPage(),
          "gesture":(BuildContext context) => GesturePage(),
          "res":(BuildContext context) => ResPage(),
          "launch":(BuildContext context) => LaunchPage(),
          "WidgetLifecycle":(BuildContext context) => WidgetLifecycle(),
          "appLifecycle":(BuildContext context)=> AppLifecycle(),
        }
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigator createState() => _RouteNavigator();
}

class _RouteNavigator extends State<RouteNavigator> {
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
              title: Text("${byName? '': "no"} ルートネームで飛ぶ"),
              value: byName,
              onChanged: (value) {
              setState(() {
                 byName = value;
            });
          }),
          _item("plugの使用", PluginUse(), "plugin"),
          _item("LessGroupPageWidget", LessGroupPage(), "less"),
          _item("StateFullGroupWidget", StateFullGroup(), "ful"),
          _item("flutterlayout", FlutterLayoutPage(), "layout"),
          _item("ボタンクリックページ", GesturePage(), "gesture"),
          _item("リソースの使用", ResPage(), "res"),
          _item("flutterで他のアプリを開く", LaunchPage(), "launch"),
          _item("WidgetLifecycle", WidgetLifecycle(), "WidgetLifecycle"),
          _item("appライフサイクル", AppLifecycle(), "appLifecycle")
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
     return Container(
       child: RaisedButton(
         onPressed: (){
           if(byName){
             Navigator.pushNamed(context, routeName); //routerの別名使用
           }else{
             Navigator.push(context, MaterialPageRoute(builder: (context)=>page)); //使用しない
           }
       },
         child: Text(title),
       ),
     );
  }

}
