// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_stories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopStoriesImpl _$$TopStoriesImplFromJson(Map<String, dynamic> json) =>
    _$TopStoriesImpl(
      storyIds:
          (json['storyIds'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$TopStoriesImplToJson(_$TopStoriesImpl instance) =>
    <String, dynamic>{
      'storyIds': instance.storyIds,
    };
