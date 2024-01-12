// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_status_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$commentStatusHash() => r'ec8892cd1bc929c6fc6d59dca81c41501b0998bc';

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

abstract class _$CommentStatus
    extends BuildlessAutoDisposeAsyncNotifier<CommentStatusModel> {
  late final int id;

  FutureOr<CommentStatusModel> build(
    int id,
  );
}

/// See also [CommentStatus].
@ProviderFor(CommentStatus)
const commentStatusProvider = CommentStatusFamily();

/// See also [CommentStatus].
class CommentStatusFamily extends Family<AsyncValue<CommentStatusModel>> {
  /// See also [CommentStatus].
  const CommentStatusFamily();

  /// See also [CommentStatus].
  CommentStatusProvider call(
    int id,
  ) {
    return CommentStatusProvider(
      id,
    );
  }

  @override
  CommentStatusProvider getProviderOverride(
    covariant CommentStatusProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'commentStatusProvider';
}

/// See also [CommentStatus].
class CommentStatusProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CommentStatus, CommentStatusModel> {
  /// See also [CommentStatus].
  CommentStatusProvider(
    int id,
  ) : this._internal(
          () => CommentStatus()..id = id,
          from: commentStatusProvider,
          name: r'commentStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commentStatusHash,
          dependencies: CommentStatusFamily._dependencies,
          allTransitiveDependencies:
              CommentStatusFamily._allTransitiveDependencies,
          id: id,
        );

  CommentStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  FutureOr<CommentStatusModel> runNotifierBuild(
    covariant CommentStatus notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(CommentStatus Function() create) {
    return ProviderOverride(
      origin: this,
      override: CommentStatusProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CommentStatus, CommentStatusModel>
      createElement() {
    return _CommentStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentStatusProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CommentStatusRef
    on AutoDisposeAsyncNotifierProviderRef<CommentStatusModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CommentStatusProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CommentStatus,
        CommentStatusModel> with CommentStatusRef {
  _CommentStatusProviderElement(super.provider);

  @override
  int get id => (origin as CommentStatusProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
