import 'package:flutter/material.dart';
// StatelessWidgetの使用
class StateLessWidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
        title: 'StatelessWidgetの使用',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: "何か")
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    var card = new SizedBox(
        height:210,
        child: new Card(
          elevation: 15.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
          child: new Column(
            children: <Widget>[
              new ListTile(
                title: new Text(
                    "title",
                    style: new TextStyle(fontWeight: FontWeight.w500)),
                subtitle: new Text('子标题'),
                leading: new Icon(
                  Icons.restaurant_menu,
                  color: Colors.blue[500],
                ),
              ),
              new Divider(color: Colors.blue,),
              new ListTile(
                title: new Text('内容一',
                    style: new TextStyle(fontWeight: FontWeight.w500)),
                leading: new Icon(
                  Icons.contact_phone,
                  color: Colors.blue[500],
                ),
              ),
            ],
          ),
        ),
    );

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 5.0,
      ),
      body: Center(
        child: card,
      ),
    );
  }

}