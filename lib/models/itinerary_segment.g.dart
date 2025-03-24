// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItinerarySegmentImpl _$$ItinerarySegmentImplFromJson(
  Map<String, dynamic> json,
) => _$ItinerarySegmentImpl(
  mode: $enumDecode(_$TransportModeEnumMap, json['mode']),
  note: json['note'] as String? ?? '',
  durationMinutes: (json['durationMinutes'] as num?)?.toInt() ?? 0,
  memo: json['memo'] as String? ?? '',
);

Map<String, dynamic> _$$ItinerarySegmentImplToJson(
  _$ItinerarySegmentImpl instance,
) => <String, dynamic>{
  'mode': _$TransportModeEnumMap[instance.mode]!,
  'note': instance.note,
  'durationMinutes': instance.durationMinutes,
  'memo': instance.memo,
};

const _$TransportModeEnumMap = {
  TransportMode.walk: 'walk',
  TransportMode.car: 'car',
  TransportMode.train: 'train',
  TransportMode.bus: 'bus',
  TransportMode.ferry: 'ferry',
  TransportMode.bicycle: 'bicycle',
};
