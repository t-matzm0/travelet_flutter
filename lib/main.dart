import 'package:flutter/material.dart';
import 'models/spot.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: HomeScreen(spots: sampleSpots), // 仮データを渡す
    );
  }
}

// 仮のサンプルデータ（開発用）
final List<Spot> sampleSpots = [
  Spot(
    id: '1',
    name: '浅草寺',
    address: '東京都台東区浅草',
    category: '観光地',
    tags: ['有名', '観光地'],
    officialUrl: 'https://www.senso-ji.jp/',
    placeId: 'ChIJ8T1GpMGOGGARDYGSgpooDWw',
    photos: [
      'https://upload.wikimedia.org/wikipedia/commons/7/75/Cloudy_Sens%C5%8D-ji.jpg',
    ],
    comment: '浅草の代表的な観光スポットです。',
    likes: 12,
    likedByMe: true,
    bookmarkCount: 8,
    bookmarkedByMe: true,
  ),
  Spot(
    id: '2',
    name: '東京スカイツリー',
    address: '東京都墨田区押上',
    category: 'ランドマーク',
    tags: ['展望', 'アトラクション'],
    officialUrl: 'https://www.tokyo-skytree.jp/',
    placeId: 'ChIJ35ov0dCOGGARKvdDH7NPHX0',
    photos: [
      'https://upload.wikimedia.org/wikipedia/commons/8/84/Tokyo_Skytree_2014_%E2%85%A2.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/0/0f/Tokyo_Skytree._%E6%9D%B1%E4%BA%AC%E3%82%B9%E3%82%AB%E3%82%A4%E3%83%84%E3%83%AA%E3%83%BC_%2814715623314%29.jpg',
    ],
    comment: '東京を一望できる電波塔です。',
    likes: 25,
    likedByMe: false,
    bookmarkCount: 15,
    bookmarkedByMe: false,
  ),
  Spot(
    id: '3',
    name: '明治神宮',
    address: '東京都渋谷区代々木神園町',
    category: '神社',
    tags: ['自然', '歴史'],
    officialUrl: 'https://www.meijijingu.or.jp/',
    placeId: 'ChIJ5SZMmreMGGARcz8QSTiJyo8',
    photos: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Meiji_Shrine_Main_building_2010.jpg/320px-Meiji_Shrine_Main_building_2010.jpg',
    ],
    comment: '東京中心にある静かな神社です。',
    likes: 18,
    likedByMe: false,
    bookmarkCount: 10,
    bookmarkedByMe: true,
  ),
];
