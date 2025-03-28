import 'package:flutter/material.dart';
import 'models/spot.dart';
import 'models/itinerary.dart';
import 'models/itinerary_point.dart';
import 'models/itinerary_segment.dart';
import 'models/transport_mode.dart';
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
      home: HomeScreen(spots: sampleSpots, itineraries: sampleItineraries),
    );
  }
}

// サンプルスポット（増加版）
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
    stayDurationMinutes: 60,
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
    stayDurationMinutes: 90,
  ),
  Spot(
    id: '3',
    name: '明治神宮',
    address: '東京都渋谷区代々木神園町',
    category: '神社',
    tags: ['自然', '歴史'],
    officialUrl: 'https://www.meijijingu.or.jp/',
    placeId: 'ChIJ5SZMmreMGGARcz8QSTiJyo8',
    photos: [],
    comment: '東京中心にある静かな神社です。',
    likes: 18,
    likedByMe: false,
    bookmarkCount: 10,
    bookmarkedByMe: true,
    stayDurationMinutes: 45,
  ),
  Spot(
    id: '4',
    name: '東京タワー',
    address: '東京都港区芝公園',
    category: 'ランドマーク',
    tags: ['観光', '歴史'],
    officialUrl: 'https://www.tokyotower.co.jp/',
    placeId: 'ChIJCewJkL2LGGAR3Qmk0vCTGkg',
    photos: [
      'https://upload.wikimedia.org/wikipedia/commons/f/fc/%E6%9D%B1%E4%BA%AC%E3%82%BF%E3%83%AF%E3%83%BC_%28214699253%29.jpeg',
    ],
    comment: '東京のシンボル的存在、夜景が美しい。',
    likes: 20,
    likedByMe: false,
    bookmarkCount: 12,
    bookmarkedByMe: false,
    stayDurationMinutes: 70,
  ),
  Spot(
    id: '5',
    name: '上野公園',
    address: '東京都台東区上野公園',
    category: '公園',
    tags: ['自然', '観光'],
    officialUrl: 'https://www.kensetsu.metro.tokyo.lg.jp/jimusho/toubuk/ueno',
    placeId: 'ChIJn1mqaZ2OGGAR9ZhKDrIHk',
    photos: [
      'https://upload.wikimedia.org/wikipedia/commons/6/60/Ueno_Park_in_Spring_2017.jpg',
      'https://s3.ap-northeast-1.amazonaws.com/repos.kids.rurubu.jp/uploads/2021/07/20163303/67162_ueno_ph1-1024x683.jpg',
    ],
    comment: '桜の季節が特に有名な、東京の大きな公園。',
    likes: 14,
    likedByMe: true,
    bookmarkCount: 9,
    bookmarkedByMe: true,
    stayDurationMinutes: 120,
  ),
  Spot(
    id: '6',
    name: '秋葉原',
    address: '東京都千代田区外神田',
    category: '商業地',
    tags: ['ショッピング', 'アニメ'],
    officialUrl: 'https://www.akihabara.jp/',
    placeId: 'ChIJ__SmPqeOGGAR42HgD-XxuV4',
    photos: [
      'https://upload.wikimedia.org/wikipedia/commons/e/ef/Akiba_denkigai.jpg',
    ],
    comment: 'オタク文化の中心地。',
    likes: 30,
    likedByMe: true,
    bookmarkCount: 18,
    bookmarkedByMe: false,
    stayDurationMinutes: 90,
  ),
];

// サンプル旅程データ（複数）
final List<Itinerary> sampleItineraries = [
  Itinerary(
    title: '東京観光1日モデルプラン',
    description: '浅草からスカイツリー、明治神宮を巡る定番コース',
    tags: ['東京', '定番', '歴史'],
    isPublic: true,
    representativeImageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/0/0f/Tokyo_Skytree._%E6%9D%B1%E4%BA%AC%E3%82%B9%E3%82%AB%E3%82%A4%E3%83%84%E3%83%AA%E3%83%BC_%2814715623314%29.jpg',
    points: [
      ItineraryPoint(spot: sampleSpots[0]),
      ItineraryPoint(spot: sampleSpots[1]),
      ItineraryPoint(spot: sampleSpots[2], isHotel: true),
    ],
    segments: [
      ItinerarySegment(mode: TransportMode.train, note: '東京メトロ銀座線'),
      ItinerarySegment(mode: TransportMode.walk),
    ],
  ),
  Itinerary(
    title: '東京グルメツアー',
    description: '人気のレストランやカフェを巡る食べ歩きプラン',
    tags: ['東京', 'グルメ', '食べ歩き'],
    isPublic: true,
    representativeImageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/2/2d/Tokyo_tower_night_view.jpg',
    points: [
      ItineraryPoint(spot: sampleSpots[3]),
      ItineraryPoint(spot: sampleSpots[4]),
    ],
    segments: [ItinerarySegment(mode: TransportMode.walk)],
  ),
  Itinerary(
    title: '東京歴史巡り',
    description: '東京の歴史的な名所を巡るプラン',
    tags: ['東京', '歴史', '文化'],
    isPublic: true,
    representativeImageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/7/73/Tokyo_Imperial_Palace.jpg',
    points: [
      ItineraryPoint(spot: sampleSpots[5]),
      ItineraryPoint(spot: sampleSpots[0]),
    ],
    segments: [ItinerarySegment(mode: TransportMode.walk)],
  ),
  Itinerary(
    title: '秋葉原ショッピング',
    description: '秋葉原で買い物とアニメ巡り',
    tags: ['東京', '買い物', 'アニメ'],
    isPublic: true,
    representativeImageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/3/3c/Akihabara_Shop_2013.jpg',
    points: [
      ItineraryPoint(spot: sampleSpots[5]),
      ItineraryPoint(spot: sampleSpots[3]),
    ],
    segments: [ItinerarySegment(mode: TransportMode.walk)],
  ),
];
