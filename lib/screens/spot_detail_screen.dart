import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/spot.dart';
import '../constants/spot_styles.dart';
import '../constants/ui_texts.dart';
import '../components/spot_tag_badge.dart';
import '../components/spot_category_badge.dart';
import '../widgets/base_scaffold.dart';

class SpotDetailScreen extends StatefulWidget {
  final Spot spot;

  const SpotDetailScreen({super.key, required this.spot});

  @override
  State<SpotDetailScreen> createState() => _SpotDetailScreenState();
}

class _SpotDetailScreenState extends State<SpotDetailScreen> {
  late Spot spot;
  late PageController _pageController;
  int _currentImageIndex = 0;
  final Set<int> _failedImageIndices = {};

  @override
  void initState() {
    super.initState();
    spot = widget.spot;
    _pageController = PageController(initialPage: _currentImageIndex);
  }

  void _openMapUrl() async {
    final encodedQuery = Uri.encodeComponent(widget.spot.name);
    final url =
        widget.spot.placeId.isNotEmpty
            ? 'https://www.google.com/maps/search/?api=1&query=$encodedQuery&query_place_id=${widget.spot.placeId}'
            : 'https://www.google.com/maps/search/?q=${Uri.encodeComponent(widget.spot.address)}';

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw '${UITexts.openMap}に失敗しました: $url';
    }
  }
  
  void _openOfficialUrl() async {
    if (widget.spot.officialUrl.isEmpty) return;
    final uri = Uri.parse(widget.spot.officialUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw '${UITexts.officialSite}に失敗しました: ${widget.spot.officialUrl}';
    }
  }

  void _showImageDialog(BuildContext context, int startIndex) {
    final validPhotos =
        List.generate(
          spot.photos.length,
          (i) => !_failedImageIndices.contains(i) ? spot.photos[i] : null,
        ).whereType<String>().toList();

    if (validPhotos.isEmpty) return;

    _currentImageIndex = startIndex;
    _pageController = PageController(initialPage: startIndex);

    showDialog(
      context: context,
      barrierDismissible: true,
      builder:
          (_) => StatefulBuilder(
            builder: (context, setState) {
              final screenSize = MediaQuery.of(context).size;
              return Dialog(
                insetPadding: const EdgeInsets.all(SpotStyles.defaultPadding),
                backgroundColor: Colors.transparent,
                child: Container(
                  width: screenSize.width * SpotStyles.imagePopupMaxWidthRatio,
                  height:
                      screenSize.height * SpotStyles.imagePopupMaxHeightRatio,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(
                      SpotStyles.borderRadius,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        itemCount: validPhotos.length,
                        onPageChanged:
                            (index) =>
                                setState(() => _currentImageIndex = index),
                        itemBuilder: (context, index) {
                          return InteractiveViewer(
                            child: Center(
                              child: Image.network(
                                validPhotos[index],
                                fit: BoxFit.contain,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        const Center(
                                          child: Text(
                                            UITexts.imageError,
                                            style:
                                                SpotStyles.placeholderTextStyle,
                                          ),
                                        ),
                              ),
                            ),
                          );
                        },
                      ),
                      if (_currentImageIndex > 0)
                        Positioned(
                          left: SpotStyles.defaultPadding,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),
                      if (_currentImageIndex < validPhotos.length - 1)
                        Positioned(
                          right: SpotStyles.defaultPadding,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),
                      Positioned(
                        top: SpotStyles.defaultPadding / 2,
                        right: SpotStyles.defaultPadding / 2,
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      Positioned(
                        bottom: SpotStyles.defaultPadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(validPhotos.length, (index) {
                            return Container(
                              width: 8,
                              height: 8,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    _currentImageIndex == index
                                        ? Colors.white
                                        : Colors.grey,
                              ),
                            );
                          }),
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final photos = widget.spot.photos;
    final allImagesFailed = _failedImageIndices.length == photos.length;

    return BaseScaffold(
      title: widget.spot.name,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SpotStyles.imageThumbnailWidth,
              child:
                  allImagesFailed || photos.isEmpty
                      ? Container(
                        width: SpotStyles.imageThumbnailWidth,
                        height: SpotStyles.imageThumbnailWidth,
                        color: SpotStyles.placeholderBackgroundColor,
                        child: const Center(
                          child: Text(
                            UITexts.noImage,
                            style: SpotStyles.placeholderTextStyle,
                          ),
                        ),
                      )
                      : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: photos.length,
                        itemBuilder: (context, index) {
                          final photoUrl = photos[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: SpotStyles.hSpaceXs,
                            ),
                            child: GestureDetector(
                              onTap:
                                  !_failedImageIndices.contains(index)
                                      ? () => _showImageDialog(context, index)
                                      : null,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  SpotStyles.borderRadius,
                                ),
                                child: Image.network(
                                  photoUrl,
                                  width: SpotStyles.imageThumbnailWidth,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    _failedImageIndices.add(index);
                                    return Container(
                                      width: SpotStyles.imageThumbnailWidth,
                                      height: SpotStyles.imageThumbnailWidth,
                                      color:
                                          SpotStyles.placeholderBackgroundColor,
                                      child: const Center(
                                        child: Text(
                                          UITexts.noImage,
                                          style:
                                              SpotStyles.placeholderTextStyle,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
            ),
            const SizedBox(height: SpotStyles.vSpaceMd),
            Row(
              children: [
                SpotCategoryBadge(category: widget.spot.category),
                const SizedBox(width: SpotStyles.hSpaceSm),
                ...widget.spot.tags.map(
                  (tag) => Padding(
                    padding: const EdgeInsets.only(right: SpotStyles.hSpaceXs),
                    child: SpotTagBadge(tag: tag),
                  ),
                ),
              ],
            ),
            const SizedBox(height: SpotStyles.vSpaceMd),
            Text(widget.spot.name, style: theme.headlineSmall),
            const SizedBox(height: SpotStyles.vSpaceXs),
            Text(widget.spot.address, style: theme.bodyMedium),
            if (widget.spot.stayDurationMinutes != null) ...[
              const SizedBox(height: SpotStyles.vSpaceXs),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    '${UITexts.stayDurationLabel}${widget.spot.stayDurationMinutes}分',
                    style: theme.bodySmall?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ],
            const SizedBox(height: SpotStyles.vSpaceSm),
            if (widget.spot.comment.isNotEmpty) ...[
              Text(UITexts.comment, style: theme.titleMedium),
              const SizedBox(height: SpotStyles.vSpaceXs),
              Text(widget.spot.comment, style: theme.bodyLarge),
              const SizedBox(height: SpotStyles.vSpaceSm),
            ],
            Row(
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.map),
                  label: const Text(UITexts.openMap),
                  onPressed: _openMapUrl,
                ),
                const SizedBox(width: SpotStyles.hSpaceSm),
                if (widget.spot.officialUrl.isNotEmpty)
                  TextButton.icon(
                    icon: const Icon(Icons.language),
                    label: const Text(UITexts.officialSite),
                    onPressed: _openOfficialUrl,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
