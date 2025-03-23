import 'package:flutter/material.dart';
import '../models/spot.dart';
import '../components/spot_action_row.dart';
import '../constants/spot_styles.dart';
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
  String _searchQuery = '';

  List<Spot> get _filteredSpots {
    if (_searchQuery.isEmpty) return widget.spots;
    final lowerQuery = _searchQuery.toLowerCase();
    return widget.spots.where((spot) {
      final inName = spot.name.toLowerCase().contains(lowerQuery);
      final inCategory = spot.category.toLowerCase().contains(lowerQuery);
      final inTags = spot.tags.any(
        (tag) => tag.toLowerCase().contains(lowerQuery),
      );
      return inName || inCategory || inTags;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'スポット一覧',
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: '検索（名前・カテゴリ・タグ）',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) => setState(() => _searchQuery = value),
          ),
          const SizedBox(height: SpotStyles.vSpaceSm),
          Expanded(
            child: ListView.separated(
              itemCount: _filteredSpots.length,
              separatorBuilder:
                  (_, __) => const SizedBox(height: SpotStyles.sectionSpacing),
              itemBuilder: (context, index) {
                final spot = _filteredSpots[index];
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
                                    const SizedBox(height: SpotStyles.vSpaceSm),
                                    Wrap(
                                      spacing: SpotStyles.hSpaceXs,
                                      runSpacing: SpotStyles.vSpaceXs,
                                      children: [
                                        SpotCategoryBadge(
                                          category: spot.category,
                                        ),
                                        ...spot.tags.map(
                                          (tag) => SpotTagBadge(tag: tag),
                                        ),
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
