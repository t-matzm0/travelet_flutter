import 'package:flutter/material.dart';

enum AccommodationType {
  hotel, // ホテル・旅館
  // camping,      // キャンプ場
  minpaku, // 民泊
  carStay, // 車中泊
  sleepTrain, // 寝台列車
  nightBus, // 深夜バス
  capsule, // カプセルホテル
  guesthouse, // ゲストハウス
  friendHouse, // 友人宅・親戚宅
  other, // その他
}

extension AccommodationTypeExtension on AccommodationType {
  String get label {
    switch (this) {
      case AccommodationType.hotel:
        return 'ホテル・旅館';
      // case AccommodationType.camping:
      //   return 'キャンプ場';
      case AccommodationType.minpaku:
        return '民泊';
      case AccommodationType.carStay:
        return '車中泊';
      case AccommodationType.sleepTrain:
        return '寝台列車';
      case AccommodationType.nightBus:
        return '深夜バス';
      case AccommodationType.capsule:
        return 'カプセルホテル';
      case AccommodationType.guesthouse:
        return 'ゲストハウス';
      case AccommodationType.friendHouse:
        return '友人・親戚宅';
      case AccommodationType.other:
        return 'その他';
    }
  }

  IconData get icon {
    switch (this) {
      case AccommodationType.hotel:
        return Icons.hotel;
      // case AccommodationType.camping:
      //   return Icons.camping;
      case AccommodationType.minpaku:
        return Icons.home;
      case AccommodationType.carStay:
        return Icons.directions_car;
      case AccommodationType.sleepTrain:
        return Icons.train;
      case AccommodationType.nightBus:
        return Icons.directions_bus;
      case AccommodationType.capsule:
        return Icons.single_bed;
      case AccommodationType.guesthouse:
        return Icons.cottage;
      case AccommodationType.friendHouse:
        return Icons.people;
      case AccommodationType.other:
        return Icons.night_shelter;
    }
  }

  Color get color {
    switch (this) {
      case AccommodationType.hotel:
        return Colors.indigo;
      // case AccommodationType.camping:
      //   return Colors.green;
      case AccommodationType.minpaku:
        return Colors.orange;
      case AccommodationType.carStay:
        return Colors.blueGrey;
      case AccommodationType.sleepTrain:
      case AccommodationType.nightBus:
        return Colors.purple;
      case AccommodationType.capsule:
        return Colors.teal;
      case AccommodationType.guesthouse:
        return Colors.brown;
      case AccommodationType.friendHouse:
        return Colors.pink;
      case AccommodationType.other:
        return Colors.grey;
    }
  }
}
