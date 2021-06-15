import 'package:dartz/dartz.dart';
import 'package:enviable_app/core/domain/entities/field_object.dart';
import 'package:enviable_app/core/domain/response/index.dart';
import 'package:enviable_app/core/domain/validator/validator.dart';

class PhotoField extends FieldObject<String?> {
  static const PhotoField DEFAULT = PhotoField._(Right(''));

  @override
  final Either<FieldObjectException<String>, String?> value;

  factory PhotoField(String input) {
    return PhotoField._(Validator.isEmpty(input));
  }

  const PhotoField._(this.value);
}
