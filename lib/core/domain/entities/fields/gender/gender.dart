import 'package:dartz/dartz.dart';
import 'package:enviable_app/core/domain/entities/field_object.dart';
import 'package:enviable_app/core/domain/entities/fields/gender/gender_type.dart';
import 'package:enviable_app/core/domain/response/index.dart';
import 'package:enviable_app/core/domain/validator/validator.dart';

class Gender extends FieldObject<GenderType> {
  static const Gender DEFAULT = Gender._(Right(GenderType.Others));

  @override
  final Either<FieldObjectException<String>, GenderType> value;

  factory Gender(GenderType type) =>
      Gender._(Validator.isEmpty<GenderType>(type));

  const Gender._(this.value);
}
