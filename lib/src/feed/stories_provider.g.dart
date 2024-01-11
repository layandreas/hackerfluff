// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$storiesHash() => r'89a1f87395993bcff273ead31e3f457dd177ce03';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Stories extends BuildlessNotifier<PagedStoriesState> {
  late final StoryListEndpoint storyListEndpoint;

  PagedStoriesState build(
    StoryListEndpoint storyListEndpoint,
  );
}

/// See also [Stories].
@ProviderFor(Stories)
const storiesProvider = StoriesFamily();

/// See also [Stories].
class StoriesFamily extends Family<PagedStoriesState> {
  /// See also [Stories].
  const StoriesFamily();

  /// See also [Stories].
  StoriesProvider call(
    StoryListEndpoint storyListEndpoint,
  ) {
    return StoriesProvider(
      storyListEndpoint,
    );
  }

  @override
  StoriesProvider getProviderOverride(
    covariant StoriesProvider provider,
  ) {
    return call(
      provider.storyListEndpoint,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'storiesProvider';
}

/// See also [Stories].
class StoriesProvider extends NotifierProviderImpl<Stories, PagedStoriesState> {
  /// See also [Stories].
  StoriesProvider(
    StoryListEndpoint storyListEndpoint,
  ) : this._internal(
          () => Stories()..storyListEndpoint = storyListEndpoint,
          from: storiesProvider,
          name: r'storiesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$storiesHash,
          dependencies: StoriesFamily._dependencies,
          allTransitiveDependencies: StoriesFamily._allTransitiveDependencies,
          storyListEndpoint: storyListEndpoint,
        );

  StoriesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.storyListEndpoint,
  }) : super.internal();

  final StoryListEndpoint storyListEndpoint;

  @override
  PagedStoriesState runNotifierBuild(
    covariant Stories notifier,
  ) {
    return notifier.build(
      storyListEndpoint,
    );
  }

  @override
  Override overrideWith(Stories Function() create) {
    return ProviderOverride(
      origin: this,
      override: StoriesProvider._internal(
        () => create()..storyListEndpoint = storyListEndpoint,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        storyListEndpoint: storyListEndpoint,
      ),
    );
  }

  @override
  NotifierProviderElement<Stories, PagedStoriesState> createElement() {
    return _StoriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StoriesProvider &&
        other.storyListEndpoint == storyListEndpoint;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, storyListEndpoint.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StoriesRef on NotifierProviderRef<PagedStoriesState> {
  /// The parameter `storyListEndpoint` of this provider.
  StoryListEndpoint get storyListEndpoint;
}

class _StoriesProviderElement
    extends NotifierProviderElement<Stories, PagedStoriesState>
    with StoriesRef {
  _StoriesProviderElement(super.provider);

  @override
  StoryListEndpoint get storyListEndpoint =>
      (origin as StoriesProvider).storyListEndpoint;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
