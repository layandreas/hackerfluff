// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$storyHash() => r'e550788e604dbb99035ed27e6859a9e0ec337786';

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

/// See also [story].
@ProviderFor(story)
const storyProvider = StoryFamily();

/// See also [story].
class StoryFamily extends Family<AsyncValue<List<Story>>> {
  /// See also [story].
  const StoryFamily();

  /// See also [story].
  StoryProvider call(
    StoryListEndpoint storyListEndPoint,
  ) {
    return StoryProvider(
      storyListEndPoint,
    );
  }

  @override
  StoryProvider getProviderOverride(
    covariant StoryProvider provider,
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
  String? get name => r'storyProvider';
}

/// See also [story].
class StoryProvider extends AutoDisposeStreamProvider<List<Story>> {
  /// See also [story].
  StoryProvider(
    StoryListEndpoint storyListEndPoint,
  ) : this._internal(
          (ref) => story(
            ref as StoryRef,
            storyListEndPoint,
          ),
          from: storyProvider,
          name: r'storyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$storyHash,
          dependencies: StoryFamily._dependencies,
          allTransitiveDependencies: StoryFamily._allTransitiveDependencies,
          storyListEndPoint: storyListEndPoint,
        );

  StoryProvider._internal(
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
    Stream<List<Story>> Function(StoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StoryProvider._internal(
        (ref) => create(ref as StoryRef),
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
  AutoDisposeStreamProviderElement<List<Story>> createElement() {
    return _StoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StoryProvider &&
        other.storyListEndPoint == storyListEndPoint;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, storyListEndPoint.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StoryRef on AutoDisposeStreamProviderRef<List<Story>> {
  /// The parameter `storyListEndPoint` of this provider.
  StoryListEndpoint get storyListEndPoint;
}

class _StoryProviderElement
    extends AutoDisposeStreamProviderElement<List<Story>> with StoryRef {
  _StoryProviderElement(super.provider);

  @override
  StoryListEndpoint get storyListEndPoint =>
      (origin as StoryProvider).storyListEndPoint;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
