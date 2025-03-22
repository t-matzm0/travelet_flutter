import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/spot.dart';

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

  @override
  void initState() {
    super.initState();
    spot = widget.spot;
    _pageController = PageController(initialPage: _currentImageIndex);
  }

  void _openMapUrl() async {
    final url =
        widget.spot.placeId != null
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
    if (widget.spot.officialUrl == null) return;
    final uri = Uri.parse(widget.spot.officialUrl!);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw '公式サイトを開けませんでした: ${widget.spot.officialUrl}';
    }
  }

  void _showImageDialog(BuildContext context, int startIndex) {
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
                  width: screenSize.width * 0.85,
                  height: screenSize.height * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        itemCount: widget.spot.photos.length,
                        onPageChanged:
                            (index) =>
                                setState(() => _currentImageIndex = index),
                        itemBuilder: (context, index) {
                          return InteractiveViewer(
                            child: Center(
                              child: Image.network(
                                widget.spot.photos[index],
                                fit: BoxFit.contain,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        const Center(
                                          child: Text(
                                            '画像を表示できません',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                              ),
                            ),
                          );
                        },
                      ),
                      // 閉じるボタン（右上）
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
                      // 左スライドボタン（最初の画像以外）
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
                      // 右スライドボタン（最後の画像以外）
                      if (_currentImageIndex < widget.spot.photos.length - 1)
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
                      // ドットインジケータ（下中央）
                      Positioned(
                        bottom: 12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(widget.spot.photos.length, (
                            index,
                          ) {
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

    return Scaffold(
      appBar: AppBar(title: Text(widget.spot.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.spot.photos.isNotEmpty)
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.spot.photos.length,
                  itemBuilder: (context, index) {
                    final photoUrl = widget.spot.photos[index];
                    return GestureDetector(
                      onTap: () => _showImageDialog(context, index),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            photoUrl,
                            width: 180,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    const Center(child: Text('画像を表示できません')),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 16),
            Text(widget.spot.name, style: theme.headlineSmall),
            const SizedBox(height: 4),
            Text(widget.spot.address, style: theme.bodyMedium),
            const SizedBox(height: 8),
            if (widget.spot.comment != null) ...[
              Text('コメント:', style: theme.titleMedium),
              const SizedBox(height: 4),
              Text(widget.spot.comment!, style: theme.bodyLarge),
              const SizedBox(height: 8),
            ],
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.thumb_up,
                    color: spot.likedByMe ? Colors.blue : Colors.grey,
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
                const SizedBox(width: 16),
                IconButton(
                  icon: Icon(
                    Icons.bookmark,
                    color: spot.bookmarkedByMe ? Colors.orange : Colors.grey,
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
                if (widget.spot.officialUrl != null)
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
