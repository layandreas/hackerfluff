// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'n_comments_seen_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nCommentsSeenHash() => r'487948f8fb1076723de40d2f5655183ea0d4c8ff';

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

abstract class _$NCommentsSeen extends BuildlessAutoDisposeAsyncNotifier<int> {
  late final int? storyId;

  FutureOr<int> build(
    int? storyId,
  );
}

/// See also [NCommentsSeen].
@ProviderFor(NCommentsSeen)
const nCommentsSeenProvider = NCommentsSeenFamily();

/// See also [NCommentsSeen].
class NCommentsSeenFamily extends Family<AsyncValue<int>> {
  /// See also [NCommentsSeen].
  const NCommentsSeenFamily();

  /// See also [NCommentsSeen].
  NCommentsSeenProvider call(
    int? storyId,
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

/// See also [NCommentsSeen].
class NCommentsSeenProvider
    extends AutoDisposeAsyncNotifierProviderImpl<NCommentsSeen, int> {
  /// See also [NCommentsSeen].
  NCommentsSeenProvider(
    int? storyId,
  ) : this._internal(
          () => NCommentsSeen()..storyId = storyId,
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

  final int? storyId;

  @override
  FutureOr<int> runNotifierBuild(
    covariant NCommentsSeen notifier,
  ) {
    return notifier.build(
      storyId,
    );
  }

  @override
  Override overrideWith(NCommentsSeen Function() create) {
    return ProviderOverride(
      origin: this,
      override: NCommentsSeenProvider._internal(
        () => create()..storyId = storyId,
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
  AutoDisposeAsyncNotifierProviderElement<NCommentsSeen, int> createElement() {
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

mixin NCommentsSeenRef on AutoDisposeAsyncNotifierProviderRef<int> {
  /// The parameter `storyId` of this provider.
  int? get storyId;
}

class _NCommentsSeenProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<NCommentsSeen, int>
    with NCommentsSeenRef {
  _NCommentsSeenProviderElement(super.provider);

  @override
  int? get storyId => (origin as NCommentsSeenProvider).storyId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
