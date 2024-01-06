// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryImpl _$$StoryImplFromJson(Map<String, dynamic> json) => _$StoryImpl(
      title: json['title'] as String,
      kids: (json['kids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      descendants: json['descendants'] as int?,
      by: json['by'] as String?,
      score: json['score'] as int?,
      time: json['time'] as int?,
      type: json['type'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$StoryImplToJson(_$StoryImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'kids': instance.kids,
      'descendants': instance.descendants,
      'by': instance.by,
      'score': instance.score,
      'time': instance.time,
      'type': instance.type,
      'url': instance.url,
    };
