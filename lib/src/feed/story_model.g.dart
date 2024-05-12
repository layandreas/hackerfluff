// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryImpl _$$StoryImplFromJson(Map<String, dynamic> json) => _$StoryImpl(
      title: json['title'] as String,
      id: (json['id'] as num).toInt(),
      kids: (json['kids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      descendants: (json['descendants'] as num?)?.toInt(),
      by: json['by'] as String?,
      score: (json['score'] as num?)?.toInt(),
      time: (json['time'] as num?)?.toInt(),
      type: json['type'] as String?,
      url: json['url'] as String?,
      nCommentsSeen: (json['nCommentsSeen'] as num?)?.toInt(),
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$StoryImplToJson(_$StoryImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'kids': instance.kids,
      'descendants': instance.descendants,
      'by': instance.by,
      'score': instance.score,
      'time': instance.time,
      'type': instance.type,
      'url': instance.url,
      'nCommentsSeen': instance.nCommentsSeen,
      'text': instance.text,
    };
