// lib/extensions/transport_mode_extension.dart
import 'package:flutter/material.dart';
import '../models/transport_mode.dart';

extension TransportModeExtension on TransportMode {
  String get label {
    switch (this) {
      case TransportMode.walk:
        return '徒歩';
      case TransportMode.car:
        return '車';
      case TransportMode.train:
        return '電車';
      case TransportMode.bus:
        return 'バス';
      case TransportMode.ferry:
        return 'フェリー';
      case TransportMode.bicycle:
        return '自転車';
    }
  }

  IconData get icon {
    switch (this) {
      case TransportMode.walk:
        return Icons.directions_walk;
      case TransportMode.car:
        return Icons.directions_car;
      case TransportMode.train:
        return Icons.train;
      case TransportMode.bus:
        return Icons.directions_bus;
      case TransportMode.ferry:
        return Icons.directions_boat;
      case TransportMode.bicycle:
        return Icons.directions_bike;
    }
  }
}
