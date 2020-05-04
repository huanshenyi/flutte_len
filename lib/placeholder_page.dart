import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:transparent_image/transparent_image.dart';

class PlaceholderPage extends StatefulWidget {
  @override
  _PlaceholderPageState createState() => _PlaceholderPageState();
}

class _PlaceholderPageState extends State<PlaceholderPage> {
  final _title = "placeholderの使用";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "placeholderの使用",
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title,),
          leading: GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            ),
            Center(
              child: FadeInImage.assetNetwork(
                  placeholder: "images/vuex.png",
                  image: "https://www.pokemon.co.jp/images/top/img_main_thum1_200326.jpg"),
            ),
          ],
        ),
      ),
    );
  }
}
