import 'package:flutter/material.dart';
import '../models/spot.dart';
import 'spot_detail_screen.dart';

class SpotListScreen extends StatefulWidget {
  @override
  _SpotListScreenState createState() => _SpotListScreenState();
}

class _SpotListScreenState extends State<SpotListScreen> {
final List<Spot> spots = [
    Spot(
      id: '1',
      name: '浅草寺',
      address: '東京都台東区浅草',
      category: '観光地',
      tags: ['有名', '観光地'],
      officialUrl: 'https://www.senso-ji.jp/',
      placeId: 'ChIJ8T1GpMGOGGARDYGSgpooDWw',
      photos: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Sensoji_2022.jpg/320px-Sensoji_2022.jpg',
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
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Tokyo_Skytree_2014_%28cropped%29.jpg/320px-Tokyo_Skytree_2014_%28cropped%29.jpg',
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

  void toggleLike(int index) {
    setState(() {
      final spot = spots[index];
      final updated = spot.copyWith(
        likedByMe: !spot.likedByMe,
        likes: spot.likedByMe ? spot.likes - 1 : spot.likes + 1,
      );
      spots[index] = updated;
    });
  }

  void toggleBookmark(int index) {
    setState(() {
      final spot = spots[index];
      final updated = spot.copyWith(
        bookmarkedByMe: !spot.bookmarkedByMe,
        bookmarkCount:
            spot.bookmarkedByMe
                ? spot.bookmarkCount - 1
                : spot.bookmarkCount + 1,
      );
      spots[index] = updated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('スポット一覧')),
      body: ListView.builder(
        itemCount: spots.length,
        itemBuilder: (context, index) {
          final spot = spots[index];
          return ListTile(
            leading:
                spot.photos.isNotEmpty
                    ? Image.network(
                      spot.photos.first,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => Container(
                            width: 50,
                            height: 50,
                            color: Colors.grey.shade300,
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.broken_image,
                              size: 24,
                              color: Colors.grey,
                            ),
                          ),
                    )
                    : Icon(Icons.place),
            title: Text(spot.name),
            subtitle: Text(spot.address),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => toggleLike(index),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        spot.likedByMe
                            ? Icons.thumb_up
                            : Icons.thumb_up_outlined,
                        size: 16,
                        color: spot.likedByMe ? Colors.redAccent : Colors.grey,
                      ),
                      SizedBox(width: 4),
                      Text('${spot.likes}'),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                GestureDetector(
                  onTap: () => toggleBookmark(index),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        spot.bookmarkedByMe
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        size: 16,
                        color: spot.bookmarkedByMe ? Colors.blue : Colors.grey,
                      ),
                      SizedBox(width: 4),
                      Text('${spot.bookmarkCount}'),
                    ],
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SpotDetailScreen(spot: spot),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
