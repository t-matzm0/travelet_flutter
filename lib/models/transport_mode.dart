// lib/models/transport_mode.dart
import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum TransportMode {
  @JsonValue('walk')
  walk,
  @JsonValue('car')
  car,
  @JsonValue('train')
  train,
  @JsonValue('bus')
  bus,
  @JsonValue('ferry')
  ferry,
  @JsonValue('bicycle')
  bicycle,
}
