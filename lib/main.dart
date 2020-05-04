import 'package:flutter/material.dart';
import 'package:flutter_len/app_lifecycle.dart';
import 'package:flutter_len/flutter_layout_page.dart';
import 'package:flutter_len/flutter_widget_lifecycle.dart';
import 'package:flutter_len/gesture_page.dart';
import 'package:flutter_len/launch_page.dart';
import 'package:flutter_len/less_group_page.dart';
import 'package:flutter_len/photo_app_page.dart';
import 'package:flutter_len/placeholder_page.dart';
import 'package:flutter_len/plugin_use.dart';
import 'package:flutter_len/res_page.dart';
import 'package:flutter_len/statefull_group_page.dart';
import 'package:flutter_len/tabbedbar_page.dart';

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
          //グローバルfontの使用
          //fontFamily: "RubikMonoOne",
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
                // fontのローカル使用
                child: Text("モードチェンジabc", style: TextStyle(fontSize: 20, fontFamily:"RubikMonoOne"),),
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
          "photoAppPage":(BuildContext context) => PhotoApp(),
          "placeholder":(BuildContext context) => PlaceholderPage(),
          "TabbedAppBarSample": (BuildContext context) => TabbedAppBarSample()
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
      child: Wrap(
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
          _item("appライフサイクル", AppLifecycle(), "appLifecycle"),
          _item("photoアプリ", PhotoApp(), "photoAppPage"),
          _item("placeholderページ", PlaceholderPage(), "placeholder"),
          _item("TabbedAppBarSample", TabbedAppBarSample(), "TabbedAppBarSample")
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
     return Container(
       padding: EdgeInsets.only(left: 5),
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
