import 'package:flutter_test/flutter_test.dart';
import 'package:travelet_flutter/models/itinerary_point.dart';
import 'package:travelet_flutter/models/spot.dart';

void main() {
  group('ItineraryPoint Model Tests', () {
    late Spot testSpot;

    setUp(() {
      testSpot = Spot(
        id: '1',
        name: 'テストスポット',
        address: 'テスト住所',
        category: 'テストカテゴリ',
        tags: ['tag1', 'tag2'],
        officialUrl: 'https://test.com',
        placeId: 'test-place',
        photos: ['photo.jpg'],
        comment: 'テストコメント',
        likes: 10,
        likedByMe: true,
        bookmarkCount: 5,
        bookmarkedByMe: false,
        stayDurationMinutes: 60,
      );
    });

    test('should create ItineraryPoint as regular spot', () {
      final point = ItineraryPoint(
        spot: testSpot,
        isHotel: false,
      );

      expect(point.spot, testSpot);
      expect(point.isHotel, false);
      expect(point.spot.name, 'テストスポット');
    });

    test('should create ItineraryPoint as hotel', () {
      final hotelSpot = Spot(
        id: '2',
        name: 'ホテルテスト',
        address: 'ホテル住所',
        category: '宿泊',
        tags: ['ホテル'],
        officialUrl: 'https://hotel.com',
        placeId: 'hotel-place',
        photos: [],
        comment: '宿泊施設',
        likes: 0,
        likedByMe: false,
        bookmarkCount: 0,
        bookmarkedByMe: false,
      );

      final point = ItineraryPoint(
        spot: hotelSpot,
        isHotel: true,
      );

      expect(point.spot, hotelSpot);
      expect(point.isHotel, true);
      expect(point.spot.category, '宿泊');
    });

    test('should default isHotel to false', () {
      final point = ItineraryPoint(
        spot: testSpot,
      );

      expect(point.isHotel, false);
    });

    test('should serialize to JSON', () {
      final point = ItineraryPoint(
        spot: testSpot,
        isHotel: true,
      );

      final json = point.toJson();

      expect(json['isHotel'], true);
      expect(json['spot'], isNotNull);
      
      // 現在の実装では、Spotオブジェクトがそのまま格納される
      // toJson()を手動で呼び出す必要がある
      expect(json['spot'], isA<Spot>());
      final spot = json['spot'] as Spot;
      expect(spot.id, '1');
      expect(spot.name, 'テストスポット');
      expect(spot.address, 'テスト住所');
      expect(spot.category, 'テストカテゴリ');
      expect(spot.tags, ['tag1', 'tag2']);
      
      // 実際のJSONシリアライズには、Spotも含めてtoJson()が必要
      final spotJson = spot.toJson();
      expect(spotJson['id'], '1');
    });

    test('should deserialize from JSON', () {
      final json = {
        'spot': {
          'id': '3',
          'name': 'JSONスポット',
          'address': 'JSON住所',
          'category': 'JSONカテゴリ',
          'tags': ['json-tag'],
          'officialUrl': 'https://json.com',
          'placeId': 'json-place',
          'photos': [],
          'comment': 'JSONコメント',
          'likes': 0,
          'likedByMe': false,
          'bookmarkCount': 0,
          'bookmarkedByMe': false,
        },
        'isHotel': true,
      };

      final point = ItineraryPoint.fromJson(json);

      expect(point.isHotel, true);
      expect(point.spot.id, '3');
      expect(point.spot.name, 'JSONスポット');
    });
  });
}