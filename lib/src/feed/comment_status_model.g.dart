// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentStatusModelImpl _$$CommentStatusModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CommentStatusModelImpl(
      id: (json['id'] as num).toInt(),
      commentWasSeen: (json['commentWasSeen'] as num).toInt(),
    );

Map<String, dynamic> _$$CommentStatusModelImplToJson(
        _$CommentStatusModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'commentWasSeen': instance.commentWasSeen,
    };
