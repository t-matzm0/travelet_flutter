import 'package:flutter/material.dart';
import '../models/itinerary.dart';
import '../extensions/transport_mode_extension.dart';
import '../models/itinerary_segment.dart';
import '../models/itinerary_point.dart';
import '../widgets/base_scaffold.dart';
import '../constants/spot_styles.dart';
import '../helpers/responsive_layout.dart';
import '../constants/ui_texts.dart';
import 'spot_detail_screen.dart';

class ItineraryDetailScreen extends StatelessWidget {
  final Itinerary itinerary;

  const ItineraryDetailScreen({super.key, required this.itinerary});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final points = itinerary.points;
    final segments = itinerary.segments;
    final representativePhoto =
        points.first.spot.photos.isNotEmpty
            ? points.first.spot.photos.first
            : null;
    final isWide = ResponsiveLayout.isWide(context);

    return BaseScaffold(
      title: itinerary.title.isNotEmpty ? itinerary.title : '旅程の詳細',
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (representativePhoto != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                representativePhoto,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder:
                    (_, __, ___) => Container(
                      height: 180,
                      width: double.infinity,
                      color: SpotStyles.placeholderBackgroundColor,
                      child: const Center(
                        child: Text(
                          SpotStyles.placeholderText,
                          style: SpotStyles.placeholderTextStyle,
                        ),
                      ),
                    ),
              ),
            )
          else
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: SpotStyles.placeholderBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  SpotStyles.placeholderText,
                  style: SpotStyles.placeholderTextStyle,
                ),
              ),
            ),
          const SizedBox(height: 12),
          Text(itinerary.description, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 12),
          isWide
              ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children:
                          itinerary.tags
                              .map((tag) => Chip(label: Text(tag)))
                              .toList(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.thumb_up,
                            color:
                                itinerary.likedByMe ? Colors.blue : Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text('${itinerary.likes}'),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.bookmark,
                            color:
                                itinerary.bookmarkedByMe
                                    ? Colors.orange
                                    : Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text('${itinerary.bookmarkCount}'),
                        ],
                      ),
                    ],
                  ),
                ],
              )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children:
                        itinerary.tags
                            .map((tag) => Chip(label: Text(tag)))
                            .toList(),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.thumb_up,
                        color: itinerary.likedByMe ? Colors.blue : Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text('${itinerary.likes}'),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.bookmark,
                        color:
                            itinerary.bookmarkedByMe
                                ? Colors.orange
                                : Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text('${itinerary.bookmarkCount}'),
                    ],
                  ),
                ],
              ),
          const SizedBox(height: 16),
          ...List.generate(points.length * 2 - 1, (i) {
            if (i.isEven) {
              final point = points[i ~/ 2];
              final spot = point.spot;
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SpotDetailScreen(spot: spot),
                      ),
                    );
                  },
                  leading:
                      spot.photos.isNotEmpty
                          ? Image.network(
                            spot.photos.first,
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (_, __, ___) => Container(
                                  width: 48,
                                  height: 48,
                                  color: SpotStyles.placeholderBackgroundColor,
                                  child: const Center(
                                    child: Text(
                                      SpotStyles.placeholderText,
                                      style: SpotStyles.placeholderTextStyle,
                                    ),
                                  ),
                                ),
                          )
                          : Container(
                            width: 48,
                            height: 48,
                            color: SpotStyles.placeholderBackgroundColor,
                            child: const Center(
                              child: Text(
                                SpotStyles.placeholderText,
                                style: SpotStyles.placeholderTextStyle,
                              ),
                            ),
                          ),
                  title: Text(spot.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(spot.address),
                      if (spot.estimatedDurationMinutes != null)
                        Text(
                          '${UITexts.stayDurationLabel}${spot.estimatedDurationMinutes}分',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                    ],
                  ),
                  trailing:
                      point.isHotel
                          ? const Icon(Icons.hotel, color: Colors.indigo)
                          : null,
                ),
              );
            } else {
              final segment = segments[i ~/ 2];
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(segment.mode.icon, size: 20),
                  const SizedBox(width: 4),
                  Text(segment.mode.label),
                  if (segment.note != null && segment.note!.isNotEmpty)
                    Text(
                      '（${segment.note}）',
                      style: const TextStyle(color: Colors.grey),
                    ),
                ],
              );
            }
          }),
        ],
      ),
    );
  }
}
