import 'package:flutter/material.dart';
import '../models/itinerary.dart';
import '../widgets/base_scaffold.dart';
import 'itinerary_detail_screen.dart';
import '../constants/spot_styles.dart';
import '../components/optimized_network_image.dart';

class ItineraryListScreen extends StatelessWidget {
  final List<Itinerary> itineraries;

  const ItineraryListScreen({super.key, required this.itineraries});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: '旅程一覧',
      child: ListView.separated(
        itemCount: itineraries.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final itinerary = itineraries[index];
          final title =
              itinerary.title.isNotEmpty ? itinerary.title : 'タイトル未設定';
          final spotNames = itinerary.points.map((p) => p.spot.name).toList();

          final String? representativeImage =
              itinerary.representativeImageUrl?.isNotEmpty == true
                  ? itinerary.representativeImageUrl
                  : itinerary.points.isNotEmpty &&
                      itinerary.points.first.spot.photos.isNotEmpty
                  ? itinerary.points.first.spot.photos.first
                  : null;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ItineraryDetailScreen(itinerary: itinerary),
                ),
              );
            },
            child: Card(
              elevation: SpotStyles.cardElevation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SpotStyles.borderRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                    child: OptimizedNetworkImage(
                      imageUrl: representativeImage ?? '',
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          spotNames.join(' → '),
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.thumb_up,
                              color:
                                  itinerary.likedByMe
                                      ? Colors.blue
                                      : Colors.grey,
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
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
