import 'package:flutter/material.dart';
import '../constants/spot_styles.dart';
import '../widgets/base_scaffold.dart';
import '../constants/spot_constants.dart';
import '../models/spot.dart';

class SpotFormScreen extends StatefulWidget {
  const SpotFormScreen({super.key});

  @override
  State<SpotFormScreen> createState() => _SpotFormScreenState();
}

class _SpotFormScreenState extends State<SpotFormScreen> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String address = '';
  String category = '';
  String tagInput = '';
  List<String> tags = [];
  String officialUrl = '';
  List<String> photos = [];
  String comment = '';

  final _photoController = TextEditingController();

  final List<String> existingTags = ['絶景', 'グルメ', '温泉', '自然', '歴史'];

  void _addTag() {
    if (tagInput.isNotEmpty && !tags.contains(tagInput)) {
      setState(() {
        tags.add(tagInput.trim());
        tagInput = '';
      });
    }
  }

  void _removeTag(String tag) {
    setState(() {
      tags.remove(tag);
    });
  }

  void _toggleExistingTag(String tag) {
    setState(() {
      if (tags.contains(tag)) {
        tags.remove(tag);
      } else {
        tags.add(tag);
      }
    });
  }

  void _addPhoto() {
    final url = _photoController.text.trim();
    final isValid = Uri.tryParse(url)?.hasAbsolutePath ?? false;

    if (url.isNotEmpty && !photos.contains(url) && isValid) {
      setState(() {
        photos.add(url);
        _photoController.clear();
      });
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('有効な画像URLを入力してください')));
    }
  }

  void _removePhoto(String url) {
    setState(() {
      photos.remove(url);
    });
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      final newSpot = Spot.fromForm(
        name: name,
        address: address,
        category: category,
        tags: tags,
        officialUrl: officialUrl,
        placeId: '', // Place ID は一時的に空文字列
        photos: photos,
        comment: comment,
      );

      Navigator.pop(context, newSpot);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('必須項目を正しく入力してください')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'スポットを追加',
      floatingActionButton: FloatingActionButton(
        onPressed: _submit,
        child: const Icon(Icons.check),
      ),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'スポット名 *'),
              validator:
                  (value) => (value == null || value.isEmpty) ? '必須項目です' : null,
              onSaved: (value) => name = value ?? '',
            ),
            const SizedBox(height: SpotStyles.vSpaceSm),
            TextFormField(
              decoration: const InputDecoration(labelText: '住所 *'),
              validator:
                  (value) => (value == null || value.isEmpty) ? '必須項目です' : null,
              onSaved: (value) => address = value ?? '',
            ),
            const SizedBox(height: SpotStyles.vSpaceSm),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'カテゴリ'),
              value: category.isNotEmpty ? category : null,
              items:
                  SpotConstants.categories
                      .map(
                        (cat) => DropdownMenuItem(value: cat, child: Text(cat)),
                      )
                      .toList(),
              onChanged: (value) => setState(() => category = value ?? ''),
              validator:
                  (value) =>
                      (value == null || value.isEmpty) ? 'カテゴリを選択してください' : null,
            ),
            const SizedBox(height: SpotStyles.vSpaceSm),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'タグ'),
                    onChanged: (value) => tagInput = value,
                    onFieldSubmitted: (_) => _addTag(),
                  ),
                ),
                IconButton(icon: const Icon(Icons.add), onPressed: _addTag),
              ],
            ),
            Wrap(
              spacing: 4,
              children:
                  tags
                      .map(
                        (tag) => Chip(
                          label: Text(tag),
                          deleteIcon: const Icon(Icons.close),
                          onDeleted: () => _removeTag(tag),
                        ),
                      )
                      .toList(),
            ),
            const SizedBox(height: SpotStyles.vSpaceXs),
            Text('人気のタグから選択:', style: Theme.of(context).textTheme.bodyMedium),
            Wrap(
              spacing: 4,
              children:
                  existingTags
                      .map(
                        (tag) => FilterChip(
                          label: Text(tag),
                          selected: tags.contains(tag),
                          onSelected: (_) => _toggleExistingTag(tag),
                        ),
                      )
                      .toList(),
            ),
            const SizedBox(height: SpotStyles.vSpaceSm),
            TextFormField(
              decoration: const InputDecoration(labelText: '公式サイトURL'),
              validator: (value) {
                if (value == null || value.isEmpty) return null;
                final uri = Uri.tryParse(value);
                if (uri == null || !uri.hasAbsolutePath) {
                  return '有効なURLを入力してください';
                }
                return null;
              },
              onSaved: (value) => officialUrl = value ?? '',
            ),
            const SizedBox(height: SpotStyles.vSpaceSm),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _photoController,
                    decoration: const InputDecoration(labelText: '画像URL'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_photo_alternate),
                  onPressed: _addPhoto,
                ),
              ],
            ),
            Wrap(
              spacing: 4,
              children:
                  photos
                      .map(
                        (url) => Chip(
                          label: Text(
                            url.length > 20
                                ? '${url.substring(0, 20)}...'
                                : url,
                          ),
                          deleteIcon: const Icon(Icons.close),
                          onDeleted: () => _removePhoto(url),
                        ),
                      )
                      .toList(),
            ),
            const SizedBox(height: SpotStyles.vSpaceSm),
            TextFormField(
              decoration: const InputDecoration(labelText: 'コメント'),
              maxLines: 3,
              onSaved: (value) => comment = value ?? '',
            ),
            const SizedBox(height: SpotStyles.vSpaceMd),
          ],
        ),
      ),
    );
  }
}
