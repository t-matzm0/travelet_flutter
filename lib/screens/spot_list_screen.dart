import 'package:flutter/material.dart';
import '../models/spot.dart';
import '../components/spot_action_row.dart';
import '../constants/spot_styles.dart';
import '../constants/ui_texts.dart';
import '../components/spot_category_badge.dart';
import '../components/spot_tag_badge.dart';
import '../widgets/base_scaffold.dart';
import 'spot_detail_screen.dart';

class SpotListScreen extends StatefulWidget {
  final List<Spot> spots;

  const SpotListScreen({super.key, required this.spots});

  @override
  State<SpotListScreen> createState() => _SpotListScreenState();
}

class _SpotListScreenState extends State<SpotListScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final queryWords = searchQuery.toLowerCase().split(RegExp(r'\s+'));

    final filteredSpots =
        widget.spots.where((spot) {
          final combined =
              '${spot.name} ${spot.address} ${spot.category} ${spot.tags.join(' ')}'
                  .toLowerCase();
          return queryWords.every((word) => combined.contains(word));
        }).toList();

    return BaseScaffold(
      title: 'スポット一覧',
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: SpotStyles.vSpaceSm),
            child: TextField(
              decoration: const InputDecoration(
                labelText: '検索（スペースで複数ワード）',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.trim();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: filteredSpots.length,
              separatorBuilder:
                  (_, __) => const SizedBox(height: SpotStyles.sectionSpacing),
              itemBuilder: (context, index) {
                final spot = filteredSpots[index];
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
                      padding: const EdgeInsets.all(SpotStyles.defaultPadding),
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
                                  spot.photos.isNotEmpty
                                      ? spot.photos.first
                                      : '',
                                  width: SpotStyles.imageThumbnailWidth,
                                  height: SpotStyles.imageThumbnailWidth,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (_, __, ___) => Container(
                                        width: SpotStyles.imageThumbnailWidth,
                                        height: SpotStyles.imageThumbnailWidth,
                                        color:
                                            SpotStyles
                                                .placeholderBackgroundColor,
                                        child: const Center(
                                          child: Text(
                                            SpotStyles.placeholderText,
                                            style:
                                                SpotStyles.placeholderTextStyle,
                                          ),
                                        ),
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
                                          Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                    ),
                                    const SizedBox(height: SpotStyles.vSpaceXs),
                                    Text(
                                      spot.address,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    if (spot.stayDurationMinutes != null)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: SpotStyles.vSpaceXs,
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.access_time,
                                              size: 16,
                                              color: Colors.grey,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '${UITexts.stayDurationLabel}${spot.stayDurationMinutes}分',
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodySmall?.copyWith(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    const SizedBox(height: SpotStyles.vSpaceSm),
                                    Wrap(
                                      spacing: SpotStyles.hSpaceXs,
                                      runSpacing: SpotStyles.vSpaceXs,
                                      children: [
                                        SpotCategoryBadge(
                                          category: spot.category,
                                        ),
                                        ...spot.tags
                                            .map(
                                              (tag) => SpotTagBadge(tag: tag),
                                            )
                                            .toList(),
                                      ],
                                    ),
                                    const SizedBox(height: SpotStyles.vSpaceSm),
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
        ],
      ),
    );
  }
}
