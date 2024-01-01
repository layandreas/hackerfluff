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
      id: json['id'] as int,
      text: json['text'] as String,
      kids: (json['kids'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'kids': instance.kids,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$topStoriesHash() => r'0fa52bafc2da9d4b037fe1b112cc49c36424b2db';

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
String _$storiesHash() => r'f0b3802ebf04fffa38c412421ee6c5854967064f';

/// See also [Stories].
@ProviderFor(Stories)
final storiesProvider =
    AutoDisposeNotifierProvider<Stories, PagedStoriesState>.internal(
  Stories.new,
  name: r'storiesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$storiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Stories = AutoDisposeNotifier<PagedStoriesState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
