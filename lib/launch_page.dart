import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("flutterで第三者のアプリを開く"),
          leading: GestureDetector( //左側のwidget
            onTap: (){
              Navigator.pop(context); //現在のページから脱出
            },
            child: Icon(Icons.arrow_back),
          )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           RaisedButton(onPressed:()=> _launchURL(),
           child: Text('ブラウザ開く'),
           ),
           RaisedButton(onPressed: () => _openMap(),
           child: Text("mapを開く"),
           )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  // ブラウザ開く
  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  //mapを開く
 _openMap() async {
   // Android
   const url = "geo:52.32,4.917"; //APP提供者からもらう schema
   if (await canLaunch(url)) {
     await launch(url);
   } else {
     //IOS
     const url = "http://maps.apple.com/?ll=52.32,4.917";
     if (await canLaunch(url)) {
       await launch(url);
     } else {
       throw "Could not launch $url";
     }
   }
  }
 }