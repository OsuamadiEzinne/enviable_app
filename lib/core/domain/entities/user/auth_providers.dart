import 'package:dartz/dartz.dart';
import 'package:enviable_app/core/domain/entities/entities.dart';
import 'package:enviable_app/core/domain/response/index.dart';
import 'package:kt_dart/kt.dart';

class AuthProviders extends FieldObject<KtList<AuthProvider?>> {
  static const AuthProviders EMPTY = AuthProviders._(Right(KtList.empty()));

  @override
  final Either<FieldObjectException<String>, KtList<AuthProvider?>> value;

  factory AuthProviders(KtList<AuthProvider> input) =>
      AuthProviders._(right(input));

  const AuthProviders._(this.value);
}
