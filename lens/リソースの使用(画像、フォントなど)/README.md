# リソースの使用

## 画像の例:

新規追加 imagesフォルダ

```yaml:pubspec.ayml
...
assets:
    - images/a_dot_burr.jpeg
    - images/a_dot_ham.jpeg
```

## 使用
### AssetImage
```dart:
...
          Image(
             image: AssetImage('images/vue-js.jpg')
          )
...
```