// lib/screens/spot_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/spot.dart';
import '../constants/spot_styles.dart';
import '../components/spot_tag_badge.dart';
import '../components/spot_category_badge.dart';

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
    final url =
        widget.spot.placeId.isNotEmpty
            ? 'https://www.google.com/maps/place/?q=place_id:${widget.spot.placeId}'
            : 'https://www.google.com/maps/search/?q=${Uri.encodeComponent(widget.spot.address)}';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw '地図を開けませんでした: $url';
    }
  }

  void _openOfficialUrl() async {
    if (widget.spot.officialUrl.isEmpty) return;
    final uri = Uri.parse(widget.spot.officialUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw '公式サイトを開けませんでした: ${widget.spot.officialUrl}';
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
                insetPadding: const EdgeInsets.all(16),
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
                                            SpotStyles.placeholderText,
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
                          left: 8,
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
                          right: 8,
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
                        top: 8,
                        right: 8,
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
                        bottom: 12,
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

    return Scaffold(
      appBar: AppBar(title: Text(widget.spot.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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
                            SpotStyles.placeholderText,
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
                            padding: const EdgeInsets.symmetric(horizontal: 4),
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
                                          SpotStyles.placeholderText,
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
            const SizedBox(height: 16),
            Row(
              children: [
                SpotCategoryBadge(category: widget.spot.category),
                const SizedBox(width: 8),
                ...widget.spot.tags.map(
                  (tag) => Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: SpotTagBadge(tag: tag),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(widget.spot.name, style: theme.headlineSmall),
            const SizedBox(height: 4),
            Text(widget.spot.address, style: theme.bodyMedium),
            const SizedBox(height: 8),
            if (widget.spot.comment.isNotEmpty) ...[
              Text('コメント:', style: theme.titleMedium),
              const SizedBox(height: 4),
              Text(widget.spot.comment, style: theme.bodyLarge),
              const SizedBox(height: 8),
            ],
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.thumb_up,
                    color:
                        spot.likedByMe
                            ? SpotStyles.likeActiveColor
                            : SpotStyles.inactiveIconColor,
                  ),
                  onPressed: () {
                    setState(() {
                      final isLiked = !spot.likedByMe;
                      spot = spot.copyWith(
                        likedByMe: isLiked,
                        likes: isLiked ? spot.likes + 1 : spot.likes - 1,
                      );
                    });
                  },
                ),
                Text('${spot.likes}'),
                const SizedBox(width: SpotStyles.iconSpacing),
                IconButton(
                  icon: Icon(
                    Icons.bookmark,
                    color:
                        spot.bookmarkedByMe
                            ? SpotStyles.bookmarkActiveColor
                            : SpotStyles.inactiveIconColor,
                  ),
                  onPressed: () {
                    setState(() {
                      final isBookmarked = !spot.bookmarkedByMe;
                      spot = spot.copyWith(
                        bookmarkedByMe: isBookmarked,
                        bookmarkCount:
                            isBookmarked
                                ? spot.bookmarkCount + 1
                                : spot.bookmarkCount - 1,
                      );
                    });
                  },
                ),
                Text('${spot.bookmarkCount}'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.map),
                  label: const Text('地図で開く'),
                  onPressed: _openMapUrl,
                ),
                const SizedBox(width: 8),
                if (widget.spot.officialUrl.isNotEmpty)
                  TextButton.icon(
                    icon: const Icon(Icons.language),
                    label: const Text('公式サイト'),
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
