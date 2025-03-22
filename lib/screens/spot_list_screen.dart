// lib/screens/spot_list_screen.dart
import 'package:flutter/material.dart';
import '../models/spot.dart';
import '../components/spot_action_row.dart';
import '../components/spot_image.dart';
import '../constants/spot_styles.dart';
import '../helpers/responsive_layout.dart';
import 'spot_detail_screen.dart';

class SpotListScreen extends StatefulWidget {
  final List<Spot> spots;

  const SpotListScreen({super.key, required this.spots});

  @override
  State<SpotListScreen> createState() => _SpotListScreenState();
}

class _SpotListScreenState extends State<SpotListScreen> {
  late List<Spot> _spots;

  @override
  void initState() {
    super.initState();
    _spots = List.from(widget.spots);
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = ResponsiveLayout.maxContentWidth(context);
    final padding = SpotStyles.defaultPadding;

    return Scaffold(
      appBar: AppBar(title: const Text('スポット一覧')),
      body: Center(
        child: Container(
          width: maxWidth,
          padding: EdgeInsets.all(padding),
          child: ListView.separated(
            itemCount: _spots.length,
            separatorBuilder:
                (_, __) => const SizedBox(height: SpotStyles.sectionSpacing),
            itemBuilder: (context, index) {
              final spot = _spots[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SpotDetailScreen(spot: spot),
                    ),
                  );
                },
                child: Card(
                  elevation: SpotStyles.cardElevation,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      SpotStyles.borderRadius,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SpotImage(
                              imageUrl:
                                  spot.photos.isNotEmpty
                                      ? spot.photos.first
                                      : '',
                              width: SpotStyles.imageThumbnailWidth,
                              height: SpotStyles.imageThumbnailWidth,
                              borderRadius: SpotStyles.borderRadius,
                            ),
                            const SizedBox(width: SpotStyles.iconSpacing),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    spot.name,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    spot.address,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const SizedBox(height: 8),
                                  SpotActionRow(
                                    likes: spot.likes,
                                    likedByMe: spot.likedByMe,
                                    bookmarkCount: spot.bookmarkCount,
                                    bookmarkedByMe: spot.bookmarkedByMe,
                                    onLikeToggle: () {
                                      setState(() {
                                        _spots[index] = spot.copyWith(
                                          likedByMe: !spot.likedByMe,
                                          likes:
                                              spot.likedByMe
                                                  ? spot.likes - 1
                                                  : spot.likes + 1,
                                        );
                                      });
                                    },
                                    onBookmarkToggle: () {
                                      setState(() {
                                        _spots[index] = spot.copyWith(
                                          bookmarkedByMe: !spot.bookmarkedByMe,
                                          bookmarkCount:
                                              spot.bookmarkedByMe
                                                  ? spot.bookmarkCount - 1
                                                  : spot.bookmarkCount + 1,
                                        );
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
