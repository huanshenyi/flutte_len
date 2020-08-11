# http関連
- プラグインをインストール
```
https://pub.dev/packages/http
```

# http プラグイン使ってgetリクエストを送信
```dart:
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpTest extends StatefulWidget {
  @override
  _HttpTestState createState() => _HttpTestState();
}

class _HttpTestState extends State<HttpTest> {
  @override
  void initState() {
    super.initState();
    // todo: ここに処理を書く
    print(1);
  }
  Utf8Decoder decode = new Utf8Decoder();
  // header
  Map<String, String> get headers => {
    "Authorization": "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyaWQiOiJMTnRTN3VnU3B0UFN0eVRyZHBrSHNQIiwiZXhwIjoxNTk3Njc2MzA0fQ.pYSYL5SoSwPu4ufsYo3XYIxDxjjXHKoVxjm5xmD6l7o"
  };
  String showResult = "";
  Future<List<TagModel>> fetchGet() async{
    var url = "http://192.168.10.115:8000/goodss/tag";
    final response = await http.get(url, headers: headers);
    Utf8Decoder utf8decoder = Utf8Decoder(); //漢字文字化け処理
    List result = json.decode(utf8decoder.convert(response.bodyBytes));
    List<TagModel> tagmodellist = result.map((m) => new TagModel.fromJson(m)).toList(); //リストのデータを変換
    print(tagmodellist);
    return tagmodellist;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
         appBar: AppBar(
           title: Text("Http"),
         ),  
        body: Column(
          children: [
            InkWell(
              onTap: (){
                fetchGet().then((List<TagModel> value) => {
                  setState((){
                    showResult = 'リスポンス name:${value[0].name} created_time:${value[0].created_time} state: ${value[0].status}';
                  })
                });
              },
              child: Text("クリック", style: TextStyle(fontSize: 26),
              ),
            ),
            Text(showResult)
          ],
        ),
      ),
    );
  }
}

class TagModel{
  final num id;
  final String created_time;
  final String name;
  final num status;
  final num user_group;

  TagModel({this.id, this.created_time, this.name, this.status, this.user_group});
  factory TagModel.fromJson(Map<String, dynamic>json){
    return TagModel(
      id: json['id'],
      created_time: json['created_time'],
      name: json['name'],
      status: json['status'],
      user_group: json['user_group']
    );
  }
}
```


# その他の良いプラグイン
dio 、httpより使いやすい
```dart:
https://pub.dev/packages/dio
```

jsonデータをdartに変換

```
https://pub.dev/packages/json_serializable
or
https://pub.dev/packages/built_value
```

オンラインで変換
```dart
https://www.devio.org/io/tools/json-to-dart/
```

