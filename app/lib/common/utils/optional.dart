import 'package:flutter/foundation.dart';

/// Java's Optional data type.
/// I learned this concept from work so It is really usefull when checking null
/// in our application and gets rid of code smell
/// There is package dependency for dart and flutter in pub.dev but this is will do for our use case.
/// if we need to do more advance stuff, we could look into the package

@immutable
class Optional<T> {
  final T? _optional;

  const Optional._internal(this._optional);

  factory Optional(T it) => Optional._internal(it);

  factory Optional.of(T it) => Optional._internal(it);

  factory Optional.ofNullable(T it) => Optional._internal(it);

  factory Optional.empty() => const Optional._internal(null);

  T orElse({required T other}) => _optional != null ? _optional! : other;
  bool isPresent() => _optional != null;

  T get() =>
      isPresent() ? _optional! : throw Exception("The Optional value is null!");

  @override
  int get hashCode => _optional.hashCode;

  @override
  bool operator ==(other) {
    return (other is Optional) && other._optional == _optional;
  }

  @override
  String toString() => "Optional(${isPresent() ? _optional : null})";
}
