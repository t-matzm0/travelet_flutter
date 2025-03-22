import 'package:flutter/material.dart';
import '../models/spot.dart';
import '../components/spot_action_row.dart';
import '../constants/spot_styles.dart';
import '../helpers/responsive_layout.dart';
import '../components/spot_category_badge.dart';
import '../components/spot_tag_badge.dart';
import 'spot_detail_screen.dart';

class SpotListScreen extends StatelessWidget {
  final List<Spot> spots;

  const SpotListScreen({super.key, required this.spots});

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
            itemCount: spots.length,
            separatorBuilder:
                (_, __) => const SizedBox(height: SpotStyles.sectionSpacing),
            itemBuilder: (context, index) {
              final spot = spots[index];
              return GestureDetector(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SpotDetailScreen(spot: spot),
                      ),
                    ),
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                SpotStyles.borderRadius,
                              ),
                              child: Image.network(
                                spot.photos.isNotEmpty ? spot.photos.first : '',
                                width: SpotStyles.imageThumbnailWidth,
                                height: SpotStyles.imageThumbnailWidth,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (_, __, ___) => Container(
                                      width: SpotStyles.imageThumbnailWidth,
                                      height: SpotStyles.imageThumbnailWidth,
                                      color: Colors.grey[300],
                                      child: const Center(child: Text('画像なし')),
                                    ),
                              ),
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
                                  Wrap(
                                    spacing: 4,
                                    runSpacing: 4,
                                    children: [
                                      SpotCategoryBadge(
                                        category: spot.category,
                                      ),
                                      ...spot.tags.map(
                                        (tag) => SpotTagBadge(tag: tag),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  SpotActionRow(
                                    likes: spot.likes,
                                    likedByMe: spot.likedByMe,
                                    bookmarkCount: spot.bookmarkCount,
                                    bookmarkedByMe: spot.bookmarkedByMe,
                                    onLikeToggle: null,
                                    onBookmarkToggle: null,
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
