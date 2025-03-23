// lib/widgets/spot_form_widget.dart
import 'package:flutter/material.dart';
import '../models/spot.dart';
import '../constants/spot_styles.dart';

class SpotFormWidget extends StatefulWidget {
  final void Function(Spot spot) onSubmit;
  final Spot? initialSpot;

  const SpotFormWidget({super.key, required this.onSubmit, this.initialSpot});

  @override
  State<SpotFormWidget> createState() => _SpotFormWidgetState();
}

class _SpotFormWidgetState extends State<SpotFormWidget> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _categoryController;
  late TextEditingController _tagsController;
  late TextEditingController _photoUrlsController;
  late TextEditingController _commentController;
  late TextEditingController _officialUrlController;
  late TextEditingController _placeIdController;

  @override
  void initState() {
    super.initState();
    final spot = widget.initialSpot;
    _nameController = TextEditingController(text: spot?.name ?? '');
    _addressController = TextEditingController(text: spot?.address ?? '');
    _categoryController = TextEditingController(text: spot?.category ?? '');
    _tagsController = TextEditingController(text: spot?.tags.join(',') ?? '');
    _photoUrlsController = TextEditingController(
      text: spot?.photos.join(',') ?? '',
    );
    _commentController = TextEditingController(text: spot?.comment ?? '');
    _officialUrlController = TextEditingController(
      text: spot?.officialUrl ?? '',
    );
    _placeIdController = TextEditingController(text: spot?.placeId ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _categoryController.dispose();
    _tagsController.dispose();
    _photoUrlsController.dispose();
    _commentController.dispose();
    _officialUrlController.dispose();
    _placeIdController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final spot = Spot(
      id: widget.initialSpot?.id ?? DateTime.now().toIso8601String(),
      name: _nameController.text.trim(),
      address: _addressController.text.trim(),
      category: _categoryController.text.trim(),
      tags:
          _tagsController.text.trim().split(',').map((e) => e.trim()).toList(),
      photos:
          _photoUrlsController.text
              .trim()
              .split(',')
              .map((e) => e.trim())
              .toList(),
      comment: _commentController.text.trim(),
      officialUrl: _officialUrlController.text.trim(),
      placeId: _placeIdController.text.trim(),
      likes: widget.initialSpot?.likes ?? 0,
      likedByMe: widget.initialSpot?.likedByMe ?? false,
      bookmarkCount: widget.initialSpot?.bookmarkCount ?? 0,
      bookmarkedByMe: widget.initialSpot?.bookmarkedByMe ?? false,
    );

    widget.onSubmit(spot);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(SpotStyles.defaultPadding),
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'スポット名'),
            validator: (value) => value!.isEmpty ? 'スポット名は必須です' : null,
          ),
          TextFormField(
            controller: _addressController,
            decoration: const InputDecoration(labelText: '住所'),
            validator: (value) => value!.isEmpty ? '住所は必須です' : null,
          ),
          TextFormField(
            controller: _categoryController,
            decoration: const InputDecoration(labelText: 'カテゴリ'),
          ),
          TextFormField(
            controller: _tagsController,
            decoration: const InputDecoration(labelText: 'タグ（カンマ区切り）'),
          ),
          TextFormField(
            controller: _photoUrlsController,
            decoration: const InputDecoration(labelText: '画像URL（カンマ区切り）'),
          ),
          TextFormField(
            controller: _commentController,
            decoration: const InputDecoration(labelText: 'コメント'),
          ),
          TextFormField(
            controller: _officialUrlController,
            decoration: const InputDecoration(labelText: '公式サイトURL'),
          ),
          TextFormField(
            controller: _placeIdController,
            decoration: const InputDecoration(labelText: 'Google Place ID'),
          ),
          const SizedBox(height: SpotStyles.vSpaceMd),
          ElevatedButton(
            onPressed: _handleSubmit,
            child: const Text('スポットを保存'),
          ),
        ],
      ),
    );
  }
}
