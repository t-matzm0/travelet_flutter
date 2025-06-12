import 'package:flutter_test/flutter_test.dart';
import 'package:travelet_flutter/models/transport_mode.dart';

void main() {
  group('TransportMode Enum Tests', () {
    test('should have all expected transport modes', () {
      expect(TransportMode.values.length, 6);
      expect(TransportMode.values.contains(TransportMode.walk), true);
      expect(TransportMode.values.contains(TransportMode.car), true);
      expect(TransportMode.values.contains(TransportMode.train), true);
      expect(TransportMode.values.contains(TransportMode.bus), true);
      expect(TransportMode.values.contains(TransportMode.ferry), true);
      expect(TransportMode.values.contains(TransportMode.bicycle), true);
    });

    test('should have correct enum values', () {
      final modes = TransportMode.values;
      
      expect(modes[0], TransportMode.walk);
      expect(modes[1], TransportMode.car);
      expect(modes[2], TransportMode.train);
      expect(modes[3], TransportMode.bus);
      expect(modes[4], TransportMode.ferry);
      expect(modes[5], TransportMode.bicycle);
    });

    test('should handle enum index correctly', () {
      expect(TransportMode.walk.index, 0);
      expect(TransportMode.car.index, 1);
      expect(TransportMode.train.index, 2);
      expect(TransportMode.bus.index, 3);
      expect(TransportMode.ferry.index, 4);
      expect(TransportMode.bicycle.index, 5);
    });

    test('should convert to string correctly', () {
      expect(TransportMode.walk.toString(), 'TransportMode.walk');
      expect(TransportMode.car.toString(), 'TransportMode.car');
      expect(TransportMode.train.toString(), 'TransportMode.train');
      expect(TransportMode.bus.toString(), 'TransportMode.bus');
      expect(TransportMode.ferry.toString(), 'TransportMode.ferry');
      expect(TransportMode.bicycle.toString(), 'TransportMode.bicycle');
    });

    test('should compare enum values correctly', () {
      expect(TransportMode.walk == TransportMode.walk, true);
      expect(TransportMode.walk == TransportMode.car, false);
      expect(TransportMode.train == TransportMode.train, true);
      expect(TransportMode.train == TransportMode.bus, false);
    });
  });
}