// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_stories_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PagedStoriesStateImpl _$$PagedStoriesStateImplFromJson(
        Map<String, dynamic> json) =>
    _$PagedStoriesStateImpl(
      currentPage: (json['currentPage'] as num?)?.toInt() ?? 0,
      stories: (json['stories'] as List<dynamic>?)
              ?.map((e) => Story.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      storiesPerPage: (json['storiesPerPage'] as num?)?.toInt() ?? 2,
      isLoading: json['isLoading'] as bool? ?? false,
      reachedEnd: json['reachedEnd'] as bool? ?? false,
      nErrors: (json['nErrors'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PagedStoriesStateImplToJson(
        _$PagedStoriesStateImpl instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'stories': instance.stories.map((e) => e.toJson()).toList(),
      'storiesPerPage': instance.storiesPerPage,
      'isLoading': instance.isLoading,
      'reachedEnd': instance.reachedEnd,
      'nErrors': instance.nErrors,
    };
