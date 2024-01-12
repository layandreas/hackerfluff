// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'n_comments_seen_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nCommentsSeenHash() => r'c4d0a5d66bd879edd548d9f5d0151ea2c5d41d3a';

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

/// See also [nCommentsSeen].
@ProviderFor(nCommentsSeen)
const nCommentsSeenProvider = NCommentsSeenFamily();

/// See also [nCommentsSeen].
class NCommentsSeenFamily extends Family<AsyncValue<int>> {
  /// See also [nCommentsSeen].
  const NCommentsSeenFamily();

  /// See also [nCommentsSeen].
  NCommentsSeenProvider call(
    int storyId,
  ) {
    return NCommentsSeenProvider(
      storyId,
    );
  }

  @override
  NCommentsSeenProvider getProviderOverride(
    covariant NCommentsSeenProvider provider,
  ) {
    return call(
      provider.storyId,
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
  String? get name => r'nCommentsSeenProvider';
}

/// See also [nCommentsSeen].
class NCommentsSeenProvider extends AutoDisposeFutureProvider<int> {
  /// See also [nCommentsSeen].
  NCommentsSeenProvider(
    int storyId,
  ) : this._internal(
          (ref) => nCommentsSeen(
            ref as NCommentsSeenRef,
            storyId,
          ),
          from: nCommentsSeenProvider,
          name: r'nCommentsSeenProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$nCommentsSeenHash,
          dependencies: NCommentsSeenFamily._dependencies,
          allTransitiveDependencies:
              NCommentsSeenFamily._allTransitiveDependencies,
          storyId: storyId,
        );

  NCommentsSeenProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.storyId,
  }) : super.internal();

  final int storyId;

  @override
  Override overrideWith(
    FutureOr<int> Function(NCommentsSeenRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NCommentsSeenProvider._internal(
        (ref) => create(ref as NCommentsSeenRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        storyId: storyId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _NCommentsSeenProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NCommentsSeenProvider && other.storyId == storyId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, storyId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NCommentsSeenRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `storyId` of this provider.
  int get storyId;
}

class _NCommentsSeenProviderElement
    extends AutoDisposeFutureProviderElement<int> with NCommentsSeenRef {
  _NCommentsSeenProviderElement(super.provider);

  @override
  int get storyId => (origin as NCommentsSeenProvider).storyId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
