import 'package:dartz/dartz.dart';
import 'package:enviable_app/core/domain/entities/field_object.dart';
import 'package:enviable_app/core/domain/response/index.dart';
import 'package:enviable_app/core/domain/validator/validator.dart';

class Password extends FieldObject<String?> {
  static const Password DEFAULT = Password._(Right(''));
  static const String kPlaceholder = 'secret';

  @override
  final Either<FieldObjectException<String>, String?> value;

  factory Password(String password, {FIELD_VALIDATION? mode}) {
    return Password._(
      Validator.passwordValidator(
        password,
        validationMode: mode,
      ),
    );
  }

  const Password._(this.value);
}
