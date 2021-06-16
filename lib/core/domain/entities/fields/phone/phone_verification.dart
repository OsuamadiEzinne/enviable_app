library phone_verification.dart;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:enviable_app/core/domain/entities/fields/phone/phone.dart';

part 'phone_verification.freezed.dart';

@freezed
@immutable
class PhoneVerification with _$PhoneVerification {
  const factory PhoneVerification({
    required Phone phone,
    PhoneAuthCredential? credential,
    @Default(false) bool verified,
    FirebaseAuthException? exception,
    required String verificationId,
    @Default(false) bool codeSent,
    int? resendToken,
    @Default(false) bool autoRetrievalTimedout,
  }) = _PhoneVerification;
}
