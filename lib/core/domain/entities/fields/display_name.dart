import 'package:dartz/dartz.dart';
import 'package:enviable_app/core/domain/entities/field_object.dart';
import 'package:enviable_app/core/domain/response/index.dart';
import 'package:enviable_app/core/domain/validator/validator.dart';

class DisplayName extends FieldObject<String?> {
  static const DisplayName DEFAULT = DisplayName._(Right(''));
  static const String kPlaceholder = 'John Doe';

  @override
  final Either<FieldObjectException<String>, String?> value;

  factory DisplayName(String input) {
    return DisplayName._(Validator.isEmpty(input));
  }

  const DisplayName._(this.value);
}
