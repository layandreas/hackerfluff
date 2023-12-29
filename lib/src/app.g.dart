// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

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

_$StoryImpl _$$StoryImplFromJson(Map<String, dynamic> json) => _$StoryImpl(
      title: json['title'] as String,
      kids: (json['kids'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$StoryImplToJson(_$StoryImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'kids': instance.kids,
    };

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: json['id'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$topStoriesHash() => r'8d8be2eab9a0150eb96680235cd1175bdf1586e7';

/// See also [topStories].
@ProviderFor(topStories)
final topStoriesProvider = AutoDisposeFutureProvider<TopStories>.internal(
  topStories,
  name: r'topStoriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$topStoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TopStoriesRef = AutoDisposeFutureProviderRef<TopStories>;
String _$storyHash() => r'ca1214a2a43f0fdc4a8d4591c61e411e71e64d37';

/// See also [story].
@ProviderFor(story)
final storyProvider = AutoDisposeStreamProvider<List<Story>>.internal(
  story,
  name: r'storyProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$storyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StoryRef = AutoDisposeStreamProviderRef<List<Story>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
