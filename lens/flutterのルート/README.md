![main](/flutter_len/lens/flutterのルート/router.PNG)

## ルートを定義(二種類)
- Navigator.pushNamed(context, routeName);
- Navigator.push(context, MaterialPageRoute(builder: (context)=>page));

```dart: main.dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("flutterのルート"),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: RouteNavigator(),
      ),
      // ここで定義
      routes: <String, WidgetBuilder>{
        'less': (BuildContext context) => LessGroupPage(),
        'ful': (BuildContext context) => StateFullGroup(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
      },
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
        children: [
          SwitchListTile(
           title: Text('${byName?'': 'no'}ルート名称でjump'),
           value: byName, onChanged: (value){
           setState(() {
             byName = value;
           }); 
          }),
          _item("StatelessWidgetのコンポネント", LessGroupPage(), 'less'),
          _item("StateFullGroupのコンポネント", StateFullGroup(), 'ful'),
          _item("FlutterLayoutPageのコンポネント", FlutterLayoutPage(), 'layout'),
        ],
      ),
    );
  }

  _item(String title, page , String routeName) {
    return Container(
      child: RaisedButton(
      onPressed: (){
        if(byName){
          Navigator.pushNamed(context, routeName);
        }else {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
        }
      },
      child: Text(title),
      ),
    );
  }
}
```

## 小ネタ
### SwitchListTileの使い方
![images](/flutter_len/lens/flutterのルート/SwitchListTitle.PNG)
```dart:
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SwitchListTile(
           title: Text('${byName?'': 'no'}ルート名称でjump'), 
           value: byName, onChanged: (value){
           setState(() {
             byName = value;
           }); 
          }),
          _item("StatelessWidgetのコンポネント", LessGroupPage(), 'less'),
          _item("StateFullGroupのコンポネント", StateFullGroup(), 'ful'),
          _item("FlutterLayoutPageのコンポネント", FlutterLayoutPage(), 'layout'),
        ],
      ),
    );
  }
```

### backボタン
leading
```dart:
        appBar: AppBar(
          title: Text("flutterのルート"),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
```