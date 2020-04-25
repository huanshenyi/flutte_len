# コマンドラインからflutterプロジェクトを作成
```
# 環境変数が入ってる場合
flutter create flutter_xx
```

# 複数のデバイスが存在する場合
```
flutter run -d 'iPhone x'
```

# flutterのライブラリサイト

```
https://pub.dev/

pubspec.yaml 内に情報追加

flutter pub get
```

# StatelessWidget(state変換無しのwidget)
```
静的ページのこと
- Container
- Text
- Icon
- CloseButton
- BackButton
- Chip
- Divider
- Card
- AlertDialog
```

# StatefulWidget
```
- MaterialApp (根)
- Scaffold (ナビゲーション、AppBarなどが含まれる)
- AppBar (Topにあるナビ)
- BottomNavigationBar (bottomにあるナビ)
- RefreshIndicator (リロード)
- image
- TextField (入力欄)
- PageView
```