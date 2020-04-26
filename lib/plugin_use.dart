import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class PluginUse extends StatefulWidget {
  @override
  _PluginUseState createState() => _PluginUseState();
}

class _PluginUseState extends State<PluginUse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("plgin使用"),
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
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(color: ColorUtil.color('#89ee00')),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
