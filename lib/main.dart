import 'package:flutter/material.dart';
import 'screens/spot_register_screen.dart'; // スポット登録ページ
import 'screens/spot_list_screen.dart'; // スポットリストページ
import 'screens/travel_plan_screen.dart'; // 旅行プラン作成ページ（後で追加）

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '旅行プランアプリ',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SpotRegisterScreen(), // 初期画面はスポット登録
    );
  }
}
