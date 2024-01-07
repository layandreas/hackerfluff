// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_stories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$topStoriesHash() => r'e7c9e722bea0d93a6de9b26d1ed3a5f23a51ce43';

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

/// See also [topStories].
@ProviderFor(topStories)
const topStoriesProvider = TopStoriesFamily();

/// See also [topStories].
class TopStoriesFamily extends Family<AsyncValue<TopStories>> {
  /// See also [topStories].
  const TopStoriesFamily();

  /// See also [topStories].
  TopStoriesProvider call(
    StoryListEndpoint storyListEndPoint,
  ) {
    return TopStoriesProvider(
      storyListEndPoint,
    );
  }

  @override
  TopStoriesProvider getProviderOverride(
    covariant TopStoriesProvider provider,
  ) {
    return call(
      provider.storyListEndPoint,
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
  String? get name => r'topStoriesProvider';
}

/// See also [topStories].
class TopStoriesProvider extends FutureProvider<TopStories> {
  /// See also [topStories].
  TopStoriesProvider(
    StoryListEndpoint storyListEndPoint,
  ) : this._internal(
          (ref) => topStories(
            ref as TopStoriesRef,
            storyListEndPoint,
          ),
          from: topStoriesProvider,
          name: r'topStoriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$topStoriesHash,
          dependencies: TopStoriesFamily._dependencies,
          allTransitiveDependencies:
              TopStoriesFamily._allTransitiveDependencies,
          storyListEndPoint: storyListEndPoint,
        );

  TopStoriesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.storyListEndPoint,
  }) : super.internal();

  final StoryListEndpoint storyListEndPoint;

  @override
  Override overrideWith(
    FutureOr<TopStories> Function(TopStoriesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TopStoriesProvider._internal(
        (ref) => create(ref as TopStoriesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        storyListEndPoint: storyListEndPoint,
      ),
    );
  }

  @override
  FutureProviderElement<TopStories> createElement() {
    return _TopStoriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TopStoriesProvider &&
        other.storyListEndPoint == storyListEndPoint;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, storyListEndPoint.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TopStoriesRef on FutureProviderRef<TopStories> {
  /// The parameter `storyListEndPoint` of this provider.
  StoryListEndpoint get storyListEndPoint;
}

class _TopStoriesProviderElement extends FutureProviderElement<TopStories>
    with TopStoriesRef {
  _TopStoriesProviderElement(super.provider);

  @override
  StoryListEndpoint get storyListEndPoint =>
      (origin as TopStoriesProvider).storyListEndPoint;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
