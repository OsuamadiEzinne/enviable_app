import 'package:dartz/dartz.dart';
import 'package:enviable_app/core/domain/entities/field_object.dart';
import 'package:enviable_app/core/domain/entities/fields/country/country.dart';
import 'package:enviable_app/core/domain/response/index.dart';
import 'package:enviable_app/core/domain/validator/validator.dart';

class Phone extends FieldObject<String?> {
  static const Phone DEFAULT = Phone._(Right(''), Country.NG);

  @override
  final Either<FieldObjectException<String>, String?> value;
  final Country country;

  factory Phone(String phone, Country country, {FIELD_VALIDATION? mode}) {
    return Phone._(
      Validator.phoneNumberValidator(phone, country, mode: mode),
      country,
    );
  }

  const Phone._(this.value, this.country);
}
