// lib/components/spot_action_row.dart
import 'package:flutter/material.dart';
import '../constants/spot_styles.dart';

class SpotActionRow extends StatelessWidget {
  final int likes;
  final bool likedByMe;
  final VoidCallback? onLikeToggle;

  final int bookmarkCount;
  final bool bookmarkedByMe;
  final VoidCallback? onBookmarkToggle;

  const SpotActionRow({
    super.key,
    required this.likes,
    required this.likedByMe,
    required this.bookmarkCount,
    required this.bookmarkedByMe,
    this.onLikeToggle,
    this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.thumb_up,
            color:
                likedByMe
                    ? SpotStyles.likeActiveColor
                    : SpotStyles.inactiveIconColor,
            size: SpotStyles.iconSize,
          ),
          onPressed: onLikeToggle,
        ),
        Text('$likes', style: SpotStyles.countTextStyle),
        const SizedBox(width: SpotStyles.iconSpacing),
        IconButton(
          icon: Icon(
            Icons.bookmark,
            color:
                bookmarkedByMe
                    ? SpotStyles.bookmarkActiveColor
                    : SpotStyles.inactiveIconColor,
            size: SpotStyles.iconSize,
          ),
          onPressed: onBookmarkToggle,
        ),
        Text('$bookmarkCount', style: SpotStyles.countTextStyle),
      ],
    );
  }
}
