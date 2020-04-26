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

# flutterのレイアウト関連
```
- Container
- RenderObjectWidget
  - SingleChildRenderObjectWidget
    - Opacity (透明度の変更)
    - ClipOval (円形へ変更)
    - ClipRRect (正方形へ変更)
    - PhysicalModel(多様な変更)
    - Align Center (真ん中寄せ)
    - Padding (内部余白)
    - SizedBox (レイアウトの大きさを制限)
    - FractionallySizedBox (水平もしくは垂直の伸びの制限)
  - MultiChildRenderObjectWidget
    - Stack
    - Flex
      - Column (垂直、上から下へ)
      - Row    (水平、左から右へ)
    - Wrap　(水平、左から右へ 改行可能)
    - Flow (あんまり使わない)
- ParentDataWidget
  - Positioned (よくStackと一緒に使用)
  - Flexible Expanded (親containerでどのくらい展開できる)
```

# routerの使用