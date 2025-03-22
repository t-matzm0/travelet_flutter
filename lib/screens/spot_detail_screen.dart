import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import '../models/spot.dart';

class SpotDetailScreen extends StatefulWidget {
  final Spot spot;

  SpotDetailScreen({required this.spot});

  @override
  _SpotDetailScreenState createState() => _SpotDetailScreenState();
}

class _SpotDetailScreenState extends State<SpotDetailScreen> {
  late Spot spot;

  @override
  void initState() {
    super.initState();
    spot = widget.spot;
  }

  void toggleLike() {
    setState(() {
      spot = spot.copyWith(
        likedByMe: !spot.likedByMe,
        likes: spot.likedByMe ? spot.likes - 1 : spot.likes + 1,
      );
    });
  }

  void toggleBookmark() {
    setState(() {
      spot = spot.copyWith(
        bookmarkedByMe: !spot.bookmarkedByMe,
        bookmarkCount:
            spot.bookmarkedByMe
                ? spot.bookmarkCount - 1
                : spot.bookmarkCount + 1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(spot.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (spot.photos.isNotEmpty) ...[
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: spot.photos.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 200,
                        height: 200,
                        color: Colors.grey.shade200,
                        child: Image.network(
                          spot.photos[index],
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) => Container(
                                color: Colors.grey.shade300,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.broken_image,
                                        size: 40,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        '画像を読み込めません',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
            ],
            Text('住所', style: Theme.of(context).textTheme.titleMedium),
            Text(spot.address, style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: 16),
            TextButton.icon(
              icon: Icon(Icons.map),
              label: Text('地図で開く'),
              onPressed: () => _openMapUrl(spot.address),
            ),
            SizedBox(height: 16),
            if (spot.officialUrl != null) ...[
              Text('公式サイト', style: Theme.of(context).textTheme.titleMedium),
              GestureDetector(
                onTap: () => _launchUrl(spot.officialUrl!),
                child: Text(
                  spot.officialUrl!,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(height: 16),
            ],
            if (spot.comment != null) ...[
              Text('コメント', style: Theme.of(context).textTheme.titleMedium),
              Text(spot.comment!, style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 16),
            ],
            Row(
              children: [
                GestureDetector(
                  onTap: toggleLike,
                  child: Row(
                    children: [
                      Icon(
                        spot.likedByMe
                            ? Icons.thumb_up
                            : Icons.thumb_up_outlined,
                        color: spot.likedByMe ? Colors.redAccent : Colors.grey,
                      ),
                      SizedBox(width: 4),
                      Text('${spot.likes} いいね'),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                GestureDetector(
                  onTap: toggleBookmark,
                  child: Row(
                    children: [
                      Icon(
                        spot.bookmarkedByMe
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color: spot.bookmarkedByMe ? Colors.blue : Colors.grey,
                      ),
                      SizedBox(width: 4),
                      Text('${spot.bookmarkCount} ブックマーク'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _openMapUrl(String address) async {
    Uri url;

    if (kIsWeb) {
      url = Uri.parse(
        'https://www.google.com/maps/search/?q=${Uri.encodeComponent(address)}',
      );
    } else if (Platform.isAndroid) {
      url = Uri.parse('geo:0,0?q=${Uri.encodeComponent(address)}');
    } else if (Platform.isIOS) {
      url = Uri.parse(
        'http://maps.apple.com/?q=${Uri.encodeComponent(address)}',
      );
    } else {
      throw 'このプラットフォームでは地図を開けません';
    }

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw '地図を開けませんでした: $url';
    }
  }
}
