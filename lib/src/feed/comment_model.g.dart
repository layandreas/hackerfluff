// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: json['id'] as int,
      text: json['text'] as String?,
      kids: (json['kids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      by: json['by'] as String?,
      time: json['time'] as int?,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'kids': instance.kids,
      'by': instance.by,
      'time': instance.time,
    };

_$CommentModelImpl _$$CommentModelImplFromJson(Map<String, dynamic> json) =>
    _$CommentModelImpl(
      id: json['id'] as int,
      text: json['text'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      by: json['by'] as String?,
      time: json['time'] as int?,
    );

Map<String, dynamic> _$$CommentModelImplToJson(_$CommentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'children': instance.children?.map((e) => e.toJson()).toList(),
      'by': instance.by,
      'time': instance.time,
    };

_$CommentModelFlatImpl _$$CommentModelFlatImplFromJson(
        Map<String, dynamic> json) =>
    _$CommentModelFlatImpl(
      id: json['id'] as int,
      text: json['text'] as String?,
      parentId: json['parentId'] as int?,
      nParents: json['nParents'] as int?,
      nChildren: json['nChildren'] as int?,
      children:
          (json['children'] as List<dynamic>?)?.map((e) => e as int).toList(),
      by: json['by'] as String?,
      time: json['time'] as int?,
    );

Map<String, dynamic> _$$CommentModelFlatImplToJson(
        _$CommentModelFlatImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'parentId': instance.parentId,
      'nParents': instance.nParents,
      'nChildren': instance.nChildren,
      'children': instance.children,
      'by': instance.by,
      'time': instance.time,
    };
