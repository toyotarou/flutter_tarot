// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarot_draw_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tarotDrawHash() => r'447fe2290a649f8c314841580539b29204ed5dd0';

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

/// See also [tarotDraw].
@ProviderFor(tarotDraw)
const tarotDrawProvider = TarotDrawFamily();

/// See also [tarotDraw].
class TarotDrawFamily extends Family<AsyncValue<TarotDrawState>> {
  /// See also [tarotDraw].
  const TarotDrawFamily();

  /// See also [tarotDraw].
  TarotDrawProvider call({
    required int drawNum,
  }) {
    return TarotDrawProvider(
      drawNum: drawNum,
    );
  }

  @override
  TarotDrawProvider getProviderOverride(
    covariant TarotDrawProvider provider,
  ) {
    return call(
      drawNum: provider.drawNum,
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
  String? get name => r'tarotDrawProvider';
}

/// See also [tarotDraw].
class TarotDrawProvider extends AutoDisposeFutureProvider<TarotDrawState> {
  /// See also [tarotDraw].
  TarotDrawProvider({
    required int drawNum,
  }) : this._internal(
          (ref) => tarotDraw(
            ref as TarotDrawRef,
            drawNum: drawNum,
          ),
          from: tarotDrawProvider,
          name: r'tarotDrawProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tarotDrawHash,
          dependencies: TarotDrawFamily._dependencies,
          allTransitiveDependencies: TarotDrawFamily._allTransitiveDependencies,
          drawNum: drawNum,
        );

  TarotDrawProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.drawNum,
  }) : super.internal();

  final int drawNum;

  @override
  Override overrideWith(
    FutureOr<TarotDrawState> Function(TarotDrawRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TarotDrawProvider._internal(
        (ref) => create(ref as TarotDrawRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        drawNum: drawNum,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TarotDrawState> createElement() {
    return _TarotDrawProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TarotDrawProvider && other.drawNum == drawNum;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, drawNum.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TarotDrawRef on AutoDisposeFutureProviderRef<TarotDrawState> {
  /// The parameter `drawNum` of this provider.
  int get drawNum;
}

class _TarotDrawProviderElement
    extends AutoDisposeFutureProviderElement<TarotDrawState> with TarotDrawRef {
  _TarotDrawProviderElement(super.provider);

  @override
  int get drawNum => (origin as TarotDrawProvider).drawNum;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
