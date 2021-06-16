import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:enviable_app/core/domain/response/index.dart';
import 'package:enviable_app/utils/utils.dart';

@immutable
abstract class FieldObject<T> {
  const FieldObject();

  Either<FieldObjectException<String>, T> get value;

  bool isEqualTo(
    String other, {
    bool inMemory = false,
  }) {
    if (isValid) {
      if (inMemory) return identical(getOrCrash, other);
      return getOrCrash == other;
    }
    return false;
  }

  Either<FieldObjectException<dynamic>, Unit> get mapped =>
      value.fold((f) => left(f), (r) => right(unit));

  FieldObjectException<dynamic>? get failure =>
      value.fold((l) => l, (_) => null);

  bool get isValid => value.isRight();

  T get getOrCrash => value.fold((failure) {
        log.e(
          'Unexpected Failure (Field Object Failure: [${value.runtimeType}])',
        );
        throw UnExpectedFailure(message: failure.message);
      }, id);

  Either<FieldObjectException<dynamic>, Unit> get failureOrUnit =>
      value.fold((l) => left(l), (r) => right(unit));

  T? get getOrNull => value.fold((failure) => null, id);

  T get getOrEmpty =>
      value.fold((failure) => (T is Iterable ? [] : '') as T, id);

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    return other is FieldObject && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'FieldObject<$T>(${getOrEmpty.toString()})';
}
