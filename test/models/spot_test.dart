import 'package:flutter_test/flutter_test.dart';
import 'package:travelet_flutter/models/spot.dart';

void main() {
  group('Spot Model Tests', () {
    test('should create Spot instance with all required fields', () {
      final spot = Spot(
        id: '1',
        name: '東京タワー',
        address: '東京都港区芝公園4丁目2-8',
        category: '観光スポット',
        tags: ['展望台', '観光', 'ランドマーク'],
        officialUrl: 'https://www.tokyotower.co.jp/',
        placeId: 'ChIJCewJkL2LGGAR3Qmk0vCTGkg',
        photos: ['photo1.jpg', 'photo2.jpg'],
        comment: '東京のシンボル的な観光スポット',
        likes: 100,
        likedByMe: true,
        bookmarkCount: 50,
        bookmarkedByMe: false,
        stayDurationMinutes: 60,
      );

      expect(spot.id, '1');
      expect(spot.name, '東京タワー');
      expect(spot.address, '東京都港区芝公園4丁目2-8');
      expect(spot.category, '観光スポット');
      expect(spot.tags.length, 3);
      expect(spot.tags[0], '展望台');
      expect(spot.officialUrl, 'https://www.tokyotower.co.jp/');
      expect(spot.placeId, 'ChIJCewJkL2LGGAR3Qmk0vCTGkg');
      expect(spot.photos.length, 2);
      expect(spot.comment, '東京のシンボル的な観光スポット');
      expect(spot.likes, 100);
      expect(spot.likedByMe, true);
      expect(spot.bookmarkCount, 50);
      expect(spot.bookmarkedByMe, false);
      expect(spot.stayDurationMinutes, 60);
    });

    test('should create Spot without optional stayDurationMinutes', () {
      final spot = Spot(
        id: '2',
        name: 'レストラン',
        address: '東京都渋谷区',
        category: '飲食店',
        tags: ['和食'],
        officialUrl: '',
        placeId: 'test-place-id',
        photos: [],
        comment: '',
        likes: 0,
        likedByMe: false,
        bookmarkCount: 0,
        bookmarkedByMe: false,
      );

      expect(spot.stayDurationMinutes, null);
    });

    test('should create Spot from fromForm factory', () {
      final spot = Spot.fromForm(
        name: '新しいスポット',
        address: 'テスト住所',
        category: 'カテゴリ',
        tags: ['タグ1', 'タグ2'],
        officialUrl: 'https://example.com',
        placeId: 'place-123',
        photos: ['photo.jpg'],
        comment: 'コメント',
      );

      expect(spot.id, isNotEmpty);
      expect(spot.name, '新しいスポット');
      expect(spot.address, 'テスト住所');
      expect(spot.category, 'カテゴリ');
      expect(spot.tags, ['タグ1', 'タグ2']);
      expect(spot.officialUrl, 'https://example.com');
      expect(spot.placeId, 'place-123');
      expect(spot.photos, ['photo.jpg']);
      expect(spot.comment, 'コメント');
      expect(spot.likes, 0);
      expect(spot.likedByMe, false);
      expect(spot.bookmarkCount, 0);
      expect(spot.bookmarkedByMe, false);
    });

    test('should serialize to JSON', () {
      final spot = Spot(
        id: '1',
        name: 'テストスポット',
        address: 'テスト住所',
        category: 'テストカテゴリ',
        tags: ['tag1', 'tag2'],
        officialUrl: 'https://test.com',
        placeId: 'test-place',
        photos: ['photo1.jpg'],
        comment: 'テストコメント',
        likes: 10,
        likedByMe: true,
        bookmarkCount: 5,
        bookmarkedByMe: false,
        stayDurationMinutes: 30,
      );

      final json = spot.toJson();

      expect(json['id'], '1');
      expect(json['name'], 'テストスポット');
      expect(json['address'], 'テスト住所');
      expect(json['category'], 'テストカテゴリ');
      expect(json['tags'], ['tag1', 'tag2']);
      expect(json['officialUrl'], 'https://test.com');
      expect(json['placeId'], 'test-place');
      expect(json['photos'], ['photo1.jpg']);
      expect(json['comment'], 'テストコメント');
      expect(json['likes'], 10);
      expect(json['likedByMe'], true);
      expect(json['bookmarkCount'], 5);
      expect(json['bookmarkedByMe'], false);
      expect(json['stayDurationMinutes'], 30);
    });

    test('should deserialize from JSON', () {
      final json = {
        'id': '1',
        'name': 'JSONスポット',
        'address': 'JSON住所',
        'category': 'JSONカテゴリ',
        'tags': ['json1', 'json2'],
        'officialUrl': 'https://json.com',
        'placeId': 'json-place',
        'photos': ['json-photo.jpg'],
        'comment': 'JSONコメント',
        'likes': 20,
        'likedByMe': false,
        'bookmarkCount': 10,
        'bookmarkedByMe': true,
        'stayDurationMinutes': 45,
      };

      final spot = Spot.fromJson(json);

      expect(spot.id, '1');
      expect(spot.name, 'JSONスポット');
      expect(spot.address, 'JSON住所');
      expect(spot.category, 'JSONカテゴリ');
      expect(spot.tags, ['json1', 'json2']);
      expect(spot.officialUrl, 'https://json.com');
      expect(spot.placeId, 'json-place');
      expect(spot.photos, ['json-photo.jpg']);
      expect(spot.comment, 'JSONコメント');
      expect(spot.likes, 20);
      expect(spot.likedByMe, false);
      expect(spot.bookmarkCount, 10);
      expect(spot.bookmarkedByMe, true);
      expect(spot.stayDurationMinutes, 45);
    });

    test('should handle empty arrays in JSON', () {
      final json = {
        'id': '1',
        'name': 'Empty Arrays Spot',
        'address': 'Test Address',
        'category': 'Test Category',
        'tags': [],
        'officialUrl': '',
        'placeId': 'test-place',
        'photos': [],
        'comment': '',
        'likes': 0,
        'likedByMe': false,
        'bookmarkCount': 0,
        'bookmarkedByMe': false,
      };

      final spot = Spot.fromJson(json);

      expect(spot.tags, isEmpty);
      expect(spot.photos, isEmpty);
      expect(spot.officialUrl, '');
      expect(spot.comment, '');
    });
  });
}