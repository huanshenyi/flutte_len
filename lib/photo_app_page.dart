import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// カメラアプリ開発
class PhotoApp extends StatefulWidget {
  @override
  _PhotoAppState createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  List<File> _images = [];
  Future getImage(bool isTakePhoto) async {
    // ボタンリストを閉じる
    Navigator.pop(context);
    var image = await ImagePicker.pickImage(source: isTakePhoto? ImageSource.camera: ImageSource.gallery);
    setState(() {
      _images.add(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("写真app"),
          leading: GestureDetector( //左側のwidget
            onTap: (){
              Navigator.pop(context); //現在のページから脱出
            },
            child: Icon(Icons.arrow_back),
          )
      ),
      body: Center(
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: _getImages(),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: '画像を選択',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
  _pickImage() async {
    //下にある上がってくるエリア
    showModalBottomSheet(context: context, builder: (context)=>Container(
      height: 160,
      child: Column(
        children: <Widget>[
          _item("写真撮影", true),
          _item("アルバムから選択", false),
        ],
      ),
    ));
  }
  _item(String title, bool isTakePhoto){
    //クリックできるボタン
     return GestureDetector(
        child: ListTile(
          leading: Icon(isTakePhoto ? Icons.camera_alt: Icons.photo_library),
          title: Text(title),
          onTap: () => getImage(isTakePhoto)
        ),
     );
  }
  _getImages(){
   return _images.map((file){
      return Stack(
        children: <Widget>[
          //正方形の容器
          ClipRRect(
            //容器の円角
            borderRadius: BorderRadius.circular(5),
            child: Image.file(file, width: 120, height: 90,fit: BoxFit.fill),
          ),
          //右上にある削除ボタン
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  _images.remove(file);
                });
              },
              //円角の削除ボタン
              child: ClipOval(
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(color: Colors.black45),
                  child: Icon(Icons.close, size: 18,color: Colors.white,),
                ),
              ),
            ),
          )
        ],
      );
    }).toList();
  }
}