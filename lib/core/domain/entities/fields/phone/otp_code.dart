import 'package:dartz/dartz.dart';
import 'package:enviable_app/core/domain/entities/field_object.dart';
import 'package:enviable_app/core/domain/response/index.dart';
import 'package:enviable_app/core/domain/validator/validator.dart';

class OTPCode extends FieldObject<String?> {
  static const CODE_LENGTH = 5;

  @override
  final Either<FieldObjectException<String>, String?> value;

  factory OTPCode(String input) {
    return OTPCode._(Validator.otpCodeValidator(input, max: CODE_LENGTH));
  }

  const OTPCode._(this.value);
}
