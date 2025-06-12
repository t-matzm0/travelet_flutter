import 'package:flutter_test/flutter_test.dart';
import 'package:travelet_flutter/models/itinerary.dart';
import 'package:travelet_flutter/models/itinerary_point.dart';
import 'package:travelet_flutter/models/itinerary_segment.dart';
import 'package:travelet_flutter/models/spot.dart';
import 'package:travelet_flutter/models/transport_mode.dart';

void main() {
  group('Itinerary Model Tests', () {
    late Spot testSpot1;
    late Spot testSpot2;
    late ItineraryPoint testPoint1;
    late ItineraryPoint testPoint2;
    late ItinerarySegment testSegment;

    setUp(() {
      testSpot1 = Spot(
        id: '1',
        name: '東京駅',
        address: '東京都千代田区丸の内',
        category: '交通',
        tags: ['駅', '交通'],
        officialUrl: 'https://www.jreast.co.jp/estation/station/info.aspx?StationCd=1039',
        placeId: 'ChIJC3Cf2PuLGGAROO00ukl8JwA',
        photos: [],
        comment: '東京の玄関口',
        likes: 0,
        likedByMe: false,
        bookmarkCount: 0,
        bookmarkedByMe: false,
      );

      testSpot2 = Spot(
        id: '2',
        name: '浅草寺',
        address: '東京都台東区浅草',
        category: '観光',
        tags: ['寺', '観光'],
        officialUrl: 'https://www.senso-ji.jp/',
        placeId: 'ChIJ8T1GpMGOGGARDYGSgpooDWw',
        photos: [],
        comment: '東京最古の寺',
        likes: 0,
        likedByMe: false,
        bookmarkCount: 0,
        bookmarkedByMe: false,
      );

      testPoint1 = ItineraryPoint(spot: testSpot1, isHotel: false);
      testPoint2 = ItineraryPoint(spot: testSpot2, isHotel: false);

      testSegment = ItinerarySegment(
        mode: TransportMode.train,
        durationMinutes: 30,
        note: '東京駅から浅草寺への移動',
        memo: '電車で約30分',
      );
    });

    test('should create Itinerary with default values', () {
      final itinerary = Itinerary(
        points: [testPoint1, testPoint2],
        segments: [testSegment],
      );

      expect(itinerary.points.length, 2);
      expect(itinerary.segments.length, 1);
      expect(itinerary.title, '');
      expect(itinerary.description, '');
      expect(itinerary.tags, isEmpty);
      expect(itinerary.isPublic, false);
      expect(itinerary.likes, 0);
      expect(itinerary.likedByMe, false);
      expect(itinerary.bookmarkCount, 0);
      expect(itinerary.bookmarkedByMe, false);
      expect(itinerary.representativeImageUrl, null);
    });

    test('should create Itinerary with all fields', () {
      final itinerary = Itinerary(
        points: [testPoint1, testPoint2],
        segments: [testSegment],
        title: '東京観光プラン',
        description: '東京の人気スポットを巡る1日プラン',
        tags: ['東京', '観光', '1日'],
        isPublic: true,
        likes: 50,
        likedByMe: true,
        bookmarkCount: 25,
        bookmarkedByMe: false,
        representativeImageUrl: 'https://example.com/image.jpg',
      );

      expect(itinerary.title, '東京観光プラン');
      expect(itinerary.description, '東京の人気スポットを巡る1日プラン');
      expect(itinerary.tags, ['東京', '観光', '1日']);
      expect(itinerary.isPublic, true);
      expect(itinerary.likes, 50);
      expect(itinerary.likedByMe, true);
      expect(itinerary.bookmarkCount, 25);
      expect(itinerary.bookmarkedByMe, false);
      expect(itinerary.representativeImageUrl, 'https://example.com/image.jpg');
    });

    test('should serialize to JSON', () {
      final itinerary = Itinerary(
        points: [testPoint1, testPoint2],
        segments: [testSegment],
        title: 'テストプラン',
        description: 'テスト説明',
        tags: ['テスト'],
        isPublic: true,
        likes: 10,
        likedByMe: true,
        bookmarkCount: 5,
        bookmarkedByMe: true,
      );

      final json = itinerary.toJson();

      expect(json['title'], 'テストプラン');
      expect(json['description'], 'テスト説明');
      expect(json['tags'], ['テスト']);
      expect(json['isPublic'], true);
      expect(json['likes'], 10);
      expect(json['likedByMe'], true);
      expect(json['bookmarkCount'], 5);
      expect(json['bookmarkedByMe'], true);
      expect(json['points'], isNotEmpty);
      expect(json['segments'], isNotEmpty);
    });

    test('should handle empty itinerary', () {
      final emptyItinerary = Itinerary(
        points: [],
        segments: [],
      );

      expect(emptyItinerary.points, isEmpty);
      expect(emptyItinerary.segments, isEmpty);
      expect(emptyItinerary.title, '');
      expect(emptyItinerary.description, '');
    });

    test('should create itinerary with hotel points', () {
      final hotelSpot = Spot(
        id: '3',
        name: 'ホテル東京',
        address: '東京都中央区',
        category: '宿泊',
        tags: ['ホテル', '宿泊'],
        officialUrl: 'https://hotel-tokyo.com',
        placeId: 'hotel-place-id',
        photos: [],
        comment: '快適なホテル',
        likes: 0,
        likedByMe: false,
        bookmarkCount: 0,
        bookmarkedByMe: false,
      );

      final hotelPoint = ItineraryPoint(spot: hotelSpot, isHotel: true);
      
      final itinerary = Itinerary(
        points: [testPoint1, hotelPoint, testPoint2],
        segments: [testSegment],
        title: '宿泊プラン',
      );

      expect(itinerary.points.length, 3);
      expect(itinerary.points[1].isHotel, true);
      expect(itinerary.points[1].spot.name, 'ホテル東京');
    });
  });
}